//
//  NamedApiResourceSwiftDataModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation
import SwiftData

@Model
class NamedApiResourceSwiftDataModel {
    var name: String
    var url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

extension NamedApiResourceSwiftDataModel {
    var toEntity: NamedApiResource{
        return NamedApiResource(name: name, url: URL(string: url)!)
    }
}
