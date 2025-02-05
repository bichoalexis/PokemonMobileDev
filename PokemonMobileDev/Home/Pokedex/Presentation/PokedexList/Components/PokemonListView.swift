//
//  PokemonListView.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 23/01/25.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var viewModel: PokedexTabViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        let resource = viewModel.pokemonsResource
        ScrollView {
            FiltersPokedexSection(viewModel: viewModel)
                .padding(.top, 16)
            ForEach(viewModel.currentPokemons, id: \.id) { pokemon in
                PokemonContainer(pokemon: pokemon) {
                    router.navigate(to: .pokemonDetails(pokemon.id))
                }
            }
            .padding(.top, 10)
            
            if resource.isLoading && !viewModel.currentPokemons.isEmpty {
                LoadingPokemonShimmerList()
            }
        }
        .scrollTargetLayout()
        .onScrollTargetVisibilityChange(
            idType: Pokemon.ID.self,
            threshold: 0.3
        ) { visiblePokemonIds in
            guard resource.isSuccess,
                  viewModel.filterType == nil,
                  let lastPokemon = resource.successValue?.last,
                  visiblePokemonIds.contains(lastPokemon.id)
            else { return }

            Task {
                await viewModel.getPokemons()
            }
        }
    }
}

