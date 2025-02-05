//
//  PokemonDetailsViewModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 29/01/25.
//

import Foundation

@MainActor
class PokemonDetailsViewModel: ObservableObject {
    @Published var pokemonResponse: ResourceOr<Pokemon, PokemonFailure> = .initial
    let useCase: GetPokemonUseCase
    
    
    init( useCase: GetPokemonUseCase = GetPokemonUseCase()) {
        self.useCase = useCase
    }
    
    func fetchPokemon(id: Int)async{
        guard !pokemonResponse.isLoading else { return }
         
        self.pokemonResponse = .loading()
        
        let pokemonResp = await useCase.execute(id: id)
        
        switch pokemonResp {
        case .success(let pokemon):
            pokemonResponse = .success(pokemon)
        case .failure(let failure):
            pokemonResponse = .failure(failure)
        }
        
    }
}
