//
//  AbilityNamedModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation

struct AbilityNamedModel: Codable {
    var ability: NamedApiResourceModel
    
}

extension AbilityNamedModel {
    var toEntity: AbilityNamed {
        return AbilityNamed(ability: ability.toEntity)
    }
}
