//
//  PokedexTabViewModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 21/01/25.
//

import Foundation

@MainActor
class PokedexTabViewModel: ObservableObject {
    @Published var pokemonsResource: ResourceOr<[Pokemon], PokemonFailure> = .initial
    @Published var searchText: String = ""
    private var currentPage: Int = 1
    @Published var currentPokemons: [Pokemon] = []
    @Published var filterType: FilterType?
    
    var getPokemonUseCase: GetPokemonsUseCase
    
    init(pokemonRepository: GetPokemonsUseCase = GetPokemonsUseCase()) {
        self.getPokemonUseCase = pokemonRepository
    }
    
    func getPokemons() async -> Void {
        guard !pokemonsResource.isLoading else { return }
        pokemonsResource = .loading()
       
        
        let response = await getPokemonUseCase.execute(page: currentPage)
        
        switch response {
        case .success(let pokemons):
            currentPokemons = currentPokemons + pokemons
            currentPokemons.sort { a, b in
                a.id < b.id
            }
            pokemonsResource = .success(currentPokemons)
            currentPage += 1
            applyFilters()
        case .failure(let failure):
            pokemonsResource = .failure(failure)
        }

    }
    
    func setFilterType(_ filterType: FilterType){
        self.filterType = filterType
        print("Filter Setted: \(filterType)")
        applyFilters()
    }
    
    func search(_ text: String){
        self.searchText = text
        applyFilters()
    }
    
    private func applyFilters() {
        guard var newList = pokemonsResource.successValue else {
            currentPokemons = []
            return
        }

        switch filterType {
        case .byType(let pokemonType):
            // 1) Filter by type (unless it's .all)
            if pokemonType != .all {
                newList = newList.filter { pokemon in
                    pokemon.types.contains { $0.pokemonType == pokemonType }
                }
            } else{
                resetFilter()
            }
            // 2) Filter by search text
            newList = filterBySearch(newList)

        case .byOrder(let orderType):
            // 1) Filter by search text first
            newList = filterBySearch(newList)
            
            // 2) Sort by order
            switch orderType {
            case .AtoZ:
                newList.sort { $0.name < $1.name }
            case .ZtoA:
                newList.sort { $0.name > $1.name }
            case .LargestNumber:
                newList.sort { $0.id > $1.id }
            case .SmallestNumber:
                newList.sort { $0.id < $1.id }
                resetFilter()
            }

        case nil:
            // If no filter is set, just apply the search
            newList = filterBySearch(newList)
        }
        
        currentPokemons = newList
    }

    private func filterBySearch(_ list: [Pokemon]) -> [Pokemon] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return list }
        return list.filter {
            $0.name.lowercased().contains(query.lowercased())
        }
    }
    
    private func resetFilter(){
        self.filterType = nil
       
    }
}
