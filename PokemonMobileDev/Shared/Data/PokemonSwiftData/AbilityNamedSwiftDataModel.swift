//
//  AbilityNamedModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation
import SwiftData

@Model
class AbilityNamedSwiftDataModel {
    var ability: NamedApiResourceModel
    
    init(ability: NamedApiResourceModel) {
        self.ability = ability
    }
    
}

extension AbilityNamedSwiftDataModel {
    var toEntity: AbilityNamed {
        return AbilityNamed(ability: ability.toEntity)
    }
}
