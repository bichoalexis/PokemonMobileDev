//
//  CriesModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation
import SwiftData

@Model
class CriesSwiftDataModel {
    var latest: String
    var legacy: String
    
    init(latest: String, legacy: String) {
        self.latest = latest
        self.legacy = legacy
    }
}

extension CriesSwiftDataModel {
    var toEntity: Cries {
        return Cries(latest: URL(string: latest)!, legacy: URL(string: legacy)!)
    }
}
