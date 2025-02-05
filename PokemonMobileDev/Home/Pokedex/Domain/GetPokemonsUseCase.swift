//
//  GetPokemonUseCase.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation

struct GetPokemonsUseCase{
    let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository = PokemonRepositoryImpl()) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(page: Int) async -> Result<[Pokemon], PokemonFailure>{
        return await pokemonRepository.fetchPokemons(page: page)
    }
}
