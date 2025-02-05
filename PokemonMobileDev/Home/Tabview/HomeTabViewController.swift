//
//  HomeTabViewController.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 06/01/25.
//

enum HomeTab {
     case pokedex
     case favorites
     case profile
 }


import Foundation

class HomeTabViewController: ObservableObject {
    @Published var selectedTab: HomeTab = .pokedex
    
    
}
