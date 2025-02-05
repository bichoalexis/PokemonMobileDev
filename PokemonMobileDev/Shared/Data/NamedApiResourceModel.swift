//
//  NamedApiResource.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation

struct NamedApiResourceModel: Codable {
    var name: String
    var url: String
}

extension NamedApiResourceModel {
    var toEntity: NamedApiResource{
        return NamedApiResource(name: name, url: URL(string: url)!)
    }
}
