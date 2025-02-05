//
//  IntExtension.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 15/01/25.
//

import Foundation

extension Int {
    var getThreeDigits: String {
        String(format: "%03d", self)
    }
}
