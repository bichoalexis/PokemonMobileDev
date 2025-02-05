//
//  PokemonTypeModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation

struct PokemonTypeNamedModel: Codable {
    var slot: Int
    var type: NamedApiResourceModel
}

extension PokemonTypeNamedModel {
    var toEntity: PokemonTypeNamed {
        return PokemonTypeNamed(slot: slot, type: type.toEntity)
    }
}
