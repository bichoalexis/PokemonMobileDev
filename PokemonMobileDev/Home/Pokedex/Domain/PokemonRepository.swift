//
//  PokemonRepository.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 21/01/25.
//

import Foundation

protocol PokemonRepository {
    func fetchPokemons(page: Int)async -> Result<[Pokemon], PokemonFailure>
    func fetchPokemon(pokemonId: Int) async -> Result<Pokemon, PokemonFailure>
    
}
