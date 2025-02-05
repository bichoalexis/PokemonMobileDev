//
//  OrderType.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 24/01/25.
//

import Foundation
import SwiftUICore

enum OrderType: CaseIterable{
   case SmallestNumber
    case LargestNumber
    case AtoZ
    case ZtoA
    
    var name: LocalizedStringKey {
        switch self {
        case .SmallestNumber:
            LocalizedStringKey("SmallestNumber")
        case .LargestNumber:
            LocalizedStringKey("LargestNumber")
        case .AtoZ:
            LocalizedStringKey("A-Z")
        case .ZtoA:
            LocalizedStringKey("Z-A")
        }
    }
}
