//
//  ShimmerPokemonContainer.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 23/01/25.
//

import SwiftUI

struct ShimmerPokemonContainer: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Rectangle()
                    .frame(width: 50, height: 8)
                    .shimmer()
                Rectangle()
                    .frame(width: 150, height: 12)
                    .shimmer()
                Spacer()
                Capsule()
                    .frame(width: 100, height: 25)
                    .shimmer()
                    
                    
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            Spacer()
            ZStack{
                Image(StringConstants.Images.loadingPokemon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 94, height: 80)
                    .shimmer()
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(
                        .gray))
            
        }
        .frame(height: 104)
        .background( RoundedRectangle(cornerRadius: 15)
            .fill(Color(UIColor.systemGray4)))
        
    }
}

#Preview {
    ShimmerPokemonContainer()
}
