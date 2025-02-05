//
//  PokemonType.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 06/01/25.
//

import SwiftUICore
enum PokemonType: String, CaseIterable {
    case all
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water

    static func fromString(_ string: String) -> PokemonType? {
        return PokemonType(rawValue: string.lowercased())
    }

    var color: Color {
        switch self {
        case .all:
            return Color.allType
        case .bug:
            return Color.bug
        case .dark:
            return Color.dark
        case .dragon:
            return Color.dragon
        case .electric:
            return Color.electric
        case .fairy:
            return Color.fairy
        case .fighting:
            return Color.fighting
        case .fire:
            return Color.fire
        case .flying:
            return Color.flying
        case .ghost:
            return Color.ghost
        case .grass:
            return Color.grass
        case .ground:
            return Color.ground
        case .ice:
            return Color.ice
        case .normal:
            return Color.normal
        case .poison:
            return Color.poison
        case .psychic:
            return Color.psychic
        case .rock:
            return Color.rock
        case .steel:
            return Color.steel
        case .water:
            return Color.water
        }
    }

    var name: String {
        switch self {
        case .all:
            return "All Types"
        default:
            return rawValue.capitalized
        }
    }
}
