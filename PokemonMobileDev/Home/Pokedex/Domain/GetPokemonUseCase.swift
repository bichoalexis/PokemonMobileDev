//
//  GetPokemonUseCase.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 29/01/25.
//

import Foundation

struct GetPokemonUseCase {
    let repository: PokemonRepository
    
    init(repository: PokemonRepository = PokemonRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) async -> Result<Pokemon, PokemonFailure>{
        return await repository.fetchPokemon(pokemonId: id)
    }
}
