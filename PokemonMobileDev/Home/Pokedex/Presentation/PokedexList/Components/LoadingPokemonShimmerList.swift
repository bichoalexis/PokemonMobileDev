//
//  LoadingPokemonShimmerList.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 23/01/25.
//

import SwiftUI

struct LoadingPokemonShimmerList: View {
    var body: some View {
        ScrollView{
            ForEach(0..<10) { _ in
                ShimmerPokemonContainer()
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    LoadingPokemonShimmerList()
}
