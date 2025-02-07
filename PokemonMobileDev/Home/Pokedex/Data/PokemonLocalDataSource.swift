//
//  PokemonLocalDataSource.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 05/02/25.
//

import SwiftData


struct PokemonLocalDataSource {
    private let container: ModelContainer
    private let context: ModelContext
    
     init() {
        let scheme = Schema([PokemonSwiftDataModel.self])
        self.container = try! ModelContainer(for: scheme, configurations: [])
        self.context = ModelContext(container)
    }
    
    @MainActor
    func fetchPokemons(page: Int = 1) async throws -> [PokemonSwiftDataModel] {
        let fetchDescriptor = FetchDescriptor<PokemonSwiftDataModel> (predicate: nil)
        
       guard let pokemons = try? context.fetch(fetchDescriptor) else {
           return []
        }
        
        return pokemons
    }
    
    @MainActor
    func savePokemons(_ pokemons: [PokemonSwiftDataModel]) async throws {
          let fetchDescriptor = FetchDescriptor<PokemonSwiftDataModel>(predicate: nil)
          let existingPokemons = try context.fetch(fetchDescriptor)
          
          let existingIDs = Set(existingPokemons.map { $0.id })
          
          for pokemon in pokemons {
              if !existingIDs.contains(pokemon.id) {
                  context.insert(pokemon)
              }
          }
          
          try context.save()
      }
    
}
