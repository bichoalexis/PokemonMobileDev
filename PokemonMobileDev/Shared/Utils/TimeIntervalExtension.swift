//
//  TimeIntervalExtension.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 05/02/25.
//

import Foundation

extension TimeInterval {
    
    // Format the given time interval to a string in mm:ss format
    var formatAsTimer: String {
        let seconds = Int(self) % 60
        let milisecons = Int((self - Double(Int(self))) * 1000)
        let minutes = Int(self) / 60
        return String(format: "%02d:%02d:%03d", minutes, seconds, milisecons)
    }
}
