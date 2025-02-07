//
//  PokemonSwiftDataModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 06/02/25.
//

import Foundation
import SwiftData

@Model
class PokemonSwiftDataModel {
    var name: String
    @Attribute(.unique) var id: Int
    var height: Int
    var weight: Int
    var order: Int
    var abilities: [AbilityNamedSwiftDataModel]
    var cries: CriesSwiftDataModel
    var forms: [NamedApiResourceSwiftDataModel]
    var moves: [NamedApiResourceSwiftDataModel]
    var sprites: SpritesSwiftDataModel
    var types: [PokemonTypeNamedSwiftDataModel]

    init(
        name: String, id: Int, height: Int, weight: Int, order: Int,
        abilities: [AbilityNamedSwiftDataModel], cries: CriesSwiftDataModel,
        forms: [NamedApiResourceSwiftDataModel],
        moves: [NamedApiResourceSwiftDataModel], sprites: SpritesSwiftDataModel,
        types: [PokemonTypeNamedSwiftDataModel]
    ) {
        self.name = name
        self.id = id
        self.height = height
        self.weight = weight
        self.order = order
        self.abilities = abilities
        self.cries = cries
        self.forms = forms
        self.moves = moves
        self.sprites = sprites
        self.types = types
    }

    var toEntity: Pokemon {
        return Pokemon(
            name: name,
            id: id,
            height: height,
            weight: weight,
            order: order,
            abilities: abilities.map { $0.toEntity }.sorted {
                $0.ability.name < $1.ability.name
            },
            cries: cries.toEntity,
            forms: forms.map({ form in
                form.toEntity
            }),
            moves: moves.map({ move in
                move.toEntity
            }),
            sprites: sprites.toEntity,
            types: types.map { $0.toEntity }.sorted{
                $0.pokemonType?.name ?? "" < $1.pokemonType?.name ?? ""
            }
        )

    }
}
