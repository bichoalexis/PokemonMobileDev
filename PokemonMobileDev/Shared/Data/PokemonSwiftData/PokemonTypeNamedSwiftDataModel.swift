//
//  PokemonTypeNamedModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 07/02/25.
//


//
//  PokemonTypeModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation
import SwiftData

@Model
class PokemonTypeNamedSwiftDataModel {
    var slot: Int
    var type: NamedApiResourceSwiftDataModel
    
    init(slot: Int, type: NamedApiResourceSwiftDataModel) {
        self.slot = slot
        self.type = type
    }
}

extension PokemonTypeNamedSwiftDataModel {
    var toEntity: PokemonTypeNamed {
        return PokemonTypeNamed(slot: slot, type: type.toEntity)
    }
}
