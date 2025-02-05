//
//  PokemonContainer.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 06/01/25.
//

import SwiftUI

struct PokemonContainer: View {
    var pokemon: Pokemon
    var onContainerTap: () -> Void = { }
    var body: some View {
        let firstType = pokemon.types.first?.pokemonType
        HStack {
            VStack(alignment: .leading) {
                Text("Nº\(pokemon.id.getThreeDigits)")
                    .fontWeight(.semibold)
                    .font(.system(size: 12))
                Text(pokemon.name)
                    .fontWeight(.semibold)
                    .font(.system(size: 21))
                HStack {
                    ForEach(
                        pokemon.types.compactMap { $0.pokemonType }, id: \.self
                    ) { validType in
                        PokemonTypeContainer(type: validType)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            Spacer()
            PokemonWithType(
                pokemonType: firstType,
                pokemonImage: pokemon.sprites.frontDefault
            )
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(
                        firstType?.color
                        ?? .white)
            )
           
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    pokemon.types.first?.pokemonType?.color.opacity(0.2)
                    ?? .clear)
        )
        .onTapGesture(perform: onContainerTap)
    }
}

