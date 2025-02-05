//
//  PokemonRepositoryImpl.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 21/01/25.
//

import Foundation

struct PokemonRepositoryImpl: PokemonRepository {
    
    let pokemonDataSource: PokemonDataSource
    
    init(pokemonDataSource: PokemonDataSource = PokemonDataSource()) {
        self.pokemonDataSource = pokemonDataSource
    }
    
    func fetchPokemons(page: Int) async -> Result<[Pokemon], PokemonFailure> {
        do {
            // Attempt to fetch Pokémon data from the data source
            let fetchPokemonResp = try await pokemonDataSource.fetchPokemons(
                page: page
            )
            
            let pokemonsDomain = fetchPokemonResp.map(\.self.toEntity)
            
            return Result.success(pokemonsDomain)
        } catch {
            // If an error occurs, propagate it to the caller
            print( error)
            return Result.failure(PokemonFailure.unknown)
        }
    }
    
    func fetchPokemon(pokemonId: Int) async -> Result<Pokemon, PokemonFailure> {
        do {
            let fetchPokemonResp = try await pokemonDataSource.fetchPokemon(pokemonId: pokemonId)
            
            let pokemonDomain = fetchPokemonResp.toEntity
            
            return Result.success(pokemonDomain)
        } catch {
            print(error)
            return Result.failure(PokemonFailure.unknown)
        }
    }
}
