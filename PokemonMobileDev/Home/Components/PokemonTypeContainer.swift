//
//  PokemonTypeContainer.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 21/01/25.
//

import Foundation
import SwiftUI

struct PokemonTypeContainer: View {
    var type: PokemonType
    var body: some View {
        HStack {
            Image(type.name)
                .resizable()
                .scaledToFit()
                .frame(width: 13, height: 13)
                .padding(3)
                .background(.white)
                .clipShape(.circle)
            Text(type.name)
                .foregroundStyle(type.color.contrastColor)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 5)
        .background(type.color)
        .clipShape(.capsule)

    }
}
