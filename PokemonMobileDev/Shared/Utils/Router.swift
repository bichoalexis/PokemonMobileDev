//
//  Router.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 18/12/24.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case createAccount
        case letsStart
        case login
        case homePage
        case pokemonDetails(Int)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
