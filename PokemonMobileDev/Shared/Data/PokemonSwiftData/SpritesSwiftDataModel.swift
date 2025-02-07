//
//  SpritesModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 07/02/25.
//

//
//  SpritesModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation
import SwiftData

@Model
class SpritesSwiftDataModel {
    var backDefault: String
    var backFemale: String?
    var backShiny: String?
    var backShinyFemale: String?
    var frontDefault: String
    var frontFemale: String?
    var frontShiny: String?
    var frontShinyFemale: String?

    init(
        backDefault: String, backFemale: String? = nil,
        backShiny: String? = nil, backShinyFemale: String? = nil,
        frontDefault: String, frontFemale: String? = nil,
        frontShiny: String? = nil, frontShinyFemale: String? = nil
    ) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
    }

}

extension SpritesSwiftDataModel {
    var toEntity: Sprites {
        return Sprites(
            backDefault: backDefault,
            backFemale: backFemale,
            backShiny: backShiny,
            backShinyFemale: backShinyFemale,
            frontDefault: frontDefault,
            frontFemale: frontFemale,
            frontShiny: frontShiny,
            frontShinyFemale: frontShinyFemale
        )
    }
}
