//
//  CriesModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation

struct CriesModel: Codable {
    var latest: String
    var legacy: String
}

extension CriesModel {
    var toEntity: Cries {
        return Cries(latest: URL(string: latest)!, legacy: URL(string: legacy)!)
    }
}
