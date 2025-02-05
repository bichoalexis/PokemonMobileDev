//
//  PokemonDataSource.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 21/01/25.
//

import Foundation

struct PokemonDataSource {
    
    func fetchPokemons(page: Int = 1) async throws -> [PokemonModel] {
        let offset = 20 * (page - 1) + 1 // Calculate the starting index for the page
        let pokemonToFetch = 20 * page // Calculate the ending index
        
        var pokemonToReturn: [PokemonModel] = []
        
        // Loop through the range of Pokémon indices
        for i in offset...pokemonToFetch {
            guard let pokemonApiUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/\(i)") else {
                throw URLError(.badURL) // Handle invalid URLs gracefully
            }
            
            let (data, response) = try await URLSession.shared.data(from: pokemonApiUrl)
            
            // Ensure the response is an HTTP response and check for status 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            // Decode the Pokémon data
            let pokemonModel = try JSONDecoder().decode(PokemonModel.self, from: data)
            
            pokemonToReturn.append(pokemonModel)
        }
        
        return pokemonToReturn
    }
    
    func fetchPokemon(pokemonId: Int) async throws -> PokemonModel {
        guard let pokemonApiUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)") else{
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: pokemonApiUrl)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let pokemonModel = try JSONDecoder().decode(PokemonModel.self, from: data)
        
        return pokemonModel
    }
}
