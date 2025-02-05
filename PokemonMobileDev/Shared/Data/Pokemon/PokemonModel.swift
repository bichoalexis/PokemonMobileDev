//
//  PokemonModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation

struct PokemonModel: Codable {
    let name: String
    let id: Int
    let height: Int
    let weight: Int
    let order: Int
    let abilities: [AbilityNamedModel]
    let cries: CriesModel
    let forms: [NamedApiResourceModel]
    let moves: [NamedApiResourceModel]
    let sprites: SpritesModel
    let types: [PokemonTypeNamedModel]

    enum CodingKeys: String, CodingKey {
        case name
        case id
        case height
        case weight
        case order
        case abilities
        case cries
        case forms
        case sprites
        case types
        case moves
        case move
    }

}

extension PokemonModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)
        height = try container.decode(Int.self, forKey: .height)
        weight = try container.decode(Int.self, forKey: .weight)
        order = try container.decode(Int.self, forKey: .order)
        abilities = try container
            .decode([AbilityNamedModel].self, forKey: .abilities)
        cries = try container.decode(CriesModel.self, forKey: .cries)
        forms = try container
            .decode([NamedApiResourceModel].self, forKey: .forms)
    
        var movesArray = try container.nestedUnkeyedContainer(forKey: .moves)
        var tempMoves = [NamedApiResourceModel]()

        while !movesArray.isAtEnd {
            let moveContainer = try movesArray.nestedContainer(
                keyedBy: CodingKeys.self
            )
            let singleMove = try moveContainer.decode(
                NamedApiResourceModel.self,
                forKey: .move
            )
            tempMoves.append(singleMove)
        }

        moves = tempMoves
        
        sprites = try container.decode(SpritesModel.self, forKey: .sprites)
        types = try container
            .decode([PokemonTypeNamedModel].self, forKey: .types)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        try container.encode(height, forKey: .height)
        try container.encode(weight, forKey: .weight)
        try container.encode(order, forKey: .order)
        try container.encode(abilities, forKey: .abilities)
        try container.encode(cries, forKey: .cries)
        try container.encode(forms, forKey: .forms)
        
        // Encode moves in a nested "move" container
        var movesArray = container.nestedUnkeyedContainer(forKey: .moves)
        for singleMove in moves {
            var moveContainer = movesArray.nestedContainer(
                keyedBy: CodingKeys.self
            )
            try moveContainer.encode(singleMove, forKey: .move)
        }

        try container.encode(sprites, forKey: .sprites)
        try container.encode(types, forKey: .types)
    }
    
    var toEntity: Pokemon{
        return Pokemon(
            name: name,
            id: id,
            height: height,
            weight: weight,
            order: order,
            abilities: abilities.map{ $0.toEntity },
            cries: cries.toEntity,
            forms: forms.map({ form in
                form.toEntity
            }),
            moves: moves.map({ move in
                move.toEntity
            }),
            sprites: sprites.toEntity,
            types: types.map{ $0.toEntity }
        )
    
    }
}
