//
//  PokemonFailure.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import Foundation

enum PokemonFailure: Error{
    func errorMessage() -> String {
        switch self {
        case .httpError(_):
            return StringConstants.ErrorMessages.httpError
        case .invalidData:
            return StringConstants.ErrorMessages.invalidData
        case .decodingError:
            return StringConstants.ErrorMessages.decodingError
        case .urlError(_):
            return StringConstants.ErrorMessages.urlError
        case .unknown:
            return StringConstants.ErrorMessages.unknownError
        }
    }
    
    case httpError(Int)
    case invalidData
    case decodingError
    case urlError(URLError)
    case unknown
    
    
    
}
