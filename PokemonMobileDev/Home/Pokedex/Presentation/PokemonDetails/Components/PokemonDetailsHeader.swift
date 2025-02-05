//
//  PokemonDetailsHeader.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 29/01/25.
//

import SwiftUI

struct PokemonDetailsHeader: View {
    var screenWidth: Double
    var screenHeight: Double
    var pokemonType: PokemonType
    var pokemonImage: String
    var pokemonSize: CGFloat?
    var body: some View {
        ZStack(alignment: .bottom) {
            Circle()
                .fill(pokemonType.color)
                .frame(
                    width: screenWidth * 1.5,
                    height: screenWidth * 1.5,
                    alignment: .center
                )
            PokemonWithType(
                pokemonType: pokemonType,
                pokemonImage: pokemonImage,
                offset: (0, screenHeight * 0.1),
                width: pokemonSize,
                height: pokemonSize
            )
            .frame(
                width: screenWidth,
                alignment: .bottom
            )
            .padding(.vertical, 35)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    PokemonDetailsHeader(
        screenWidth: 500, screenHeight: 500,
        pokemonType: .bug, pokemonImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
        pokemonSize: 100
    )
}
