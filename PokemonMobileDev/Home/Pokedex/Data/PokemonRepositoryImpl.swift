//
//  PokemonRepositoryImpl.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 21/01/25.
//

import Foundation

class PokemonRepositoryImpl: PokemonRepository {

    let pokemonDataSource: PokemonDataSource
    let pokemonLocalDataSource: PokemonLocalDataSource
    private var currentPage: Int = 0

    init(
        pokemonDataSource: PokemonDataSource = PokemonDataSource(),
        pokemonLocalDataSource: PokemonLocalDataSource =
            PokemonLocalDataSource()
    ) {
        self.pokemonDataSource = pokemonDataSource
        self.pokemonLocalDataSource = pokemonLocalDataSource
    }

    func fetchPokemons(page: Int) async -> Result<[Pokemon], PokemonFailure> {
        do {
            // First, get what's already in the local DB.
            let localPokemons = try await pokemonLocalDataSource.fetchPokemons()
            
            // Decide if we need to update local storage:
            // For page 1: update only if local DB is empty.
            // For subsequent pages: update if the requested page is higher than the current page.
            let shouldUpdateLocal: Bool = {
                if page == 1 {
                    return localPokemons.isEmpty
                } else {
                    return page > currentPage
                }
            }()
            
            if shouldUpdateLocal {
                // Fetch from network
                let networkPokemons = try await pokemonDataSource.fetchPokemons(page: page)
                // Convert network models to SwiftData models.
                let pokemonsSwiftData = networkPokemons.map { $0.toPokemonSwiftDataModel }
                // Save new records to the local DB (duplicates will be skipped inside savePokemons).
                try await pokemonLocalDataSource.savePokemons(pokemonsSwiftData)
                // Update the last fetched page.
                currentPage = page
                // Convert network models to Entities
                let domainModels = networkPokemons.map(\.self.toEntity)
                // Return only the fetched page
                return .success(domainModels)
            }
            
            // After any update (or if no update was needed), return local data.
            let updatedLocalPokemons = try await pokemonLocalDataSource.fetchPokemons()
            let domainModels = updatedLocalPokemons.map { $0.toEntity }
            return .success(domainModels)
            
        } catch {
            print("Error fetching pokemons: \(error)")
            return .failure(PokemonFailure.unknown)
        }
    }

    func fetchPokemon(pokemonId: Int) async -> Result<Pokemon, PokemonFailure> {
        do {
            let fetchPokemonResp = try await pokemonDataSource.fetchPokemon(
                pokemonId: pokemonId)

            let pokemonDomain = fetchPokemonResp.toEntity

            return Result.success(pokemonDomain)
        } catch {
            print(error)
            return Result.failure(PokemonFailure.unknown)
        }
    }
}
