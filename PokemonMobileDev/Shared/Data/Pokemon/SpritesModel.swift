//
//  SpritesModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation

struct SpritesModel: Codable {
    var backDefault: String
    var backFemale: String?
    var backShiny: String?
    var backShinyFemale: String?
    var frontDefault: String
    var frontFemale: String?
    var frontShiny: String?
    var frontShinyFemale: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

extension SpritesModel {
    var toEntity: Sprites{
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
