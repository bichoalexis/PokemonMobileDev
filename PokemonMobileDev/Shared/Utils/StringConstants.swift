//
//  StringConstants.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 21/01/25.
//

import Foundation

struct StringConstants{
    
    struct General{
        static let searchPokemon = NSLocalizedString(
            "Search_Pokemon",
            comment: "Search Pokemon"
        )
    }
    
    struct FilterPokedex{
        static let allTypes = NSLocalizedString("AllTypes", comment: "All types")
        static let selectType = NSLocalizedString("SelectType", comment: "Select type")
        static let selectOrder = NSLocalizedString("SelectOrder", comment: "Select order")
        static let smallerNumber = NSLocalizedString("SmallestNumber", comment: "Smaller number")
        static let largestNumber = NSLocalizedString("LargestNumber", comment: "Largest number")
        static let nameAZ = NSLocalizedString("A-Z", comment: "Name (A-Z)")
        static let nameZA = NSLocalizedString("Z-A", comment: "Name (Z-A)")
    }
    
    struct Images{
        static let loadingPokemon = "LoadingPokemon"
    }
    
    struct ErrorMessages{
        static let httpError = NSLocalizedString(
            "HTTP Error",
            comment: "HTTP Error"
        )
        static let invalidData = NSLocalizedString(
            "Invalid Data",
            comment:"Invalid Data"
        )
        static let decodingError = NSLocalizedString(
            "Decoding Error",
            comment:"Decoding Error"
        )
        static let urlError = NSLocalizedString(
            "URL Error",
            comment:"URL Error"
        )
        static let unknownError = NSLocalizedString(
            "Unknown Error",
            comment:"Unknown Error"
        )
    }
}
