//
//  Pokemon.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 08/01/25.
//

import Foundation

struct Pokemon: Identifiable, Equatable {
    let name: String
    let id: Int
    let height: Int
    let weight: Int
    let order: Int
    let abilities: [AbilityNamed]
    let cries: Cries
    let forms: [NamedApiResource]
    let moves: [NamedApiResource]
    let sprites: Sprites
    let types: [PokemonTypeNamed]

}
