//
//  Types.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 14/01/25.
//

import Foundation

struct PokemonTypeNamed: Equatable {
    var slot: Int
    var type: NamedApiResource

    var pokemonType: PokemonType? {
        PokemonType.fromString(type.name)
    }
}
