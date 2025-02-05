//
//  PokemonWithType.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 29/01/25.
//

import SwiftUI

struct PokemonWithType: View {
    var pokemonType: PokemonType?
    var pokemonImage: String
    var pokemonBottomTitle: String?
    var offset: (x: CGFloat ,y: CGFloat)?
    var width: CGFloat? = 94
    var height: CGFloat? = 94
    var body: some View {
        VStack{
            ZStack {
                if let firstTypeName = pokemonType?.name {
                    Image(firstTypeName)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.white.opacity(0.4))
                        .frame(width: width, height: height)
                        
                }
                AsyncImage(
                    url: URL(string: pokemonImage)
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: height)
                        
                } placeholder: {
                    Image(StringConstants.Images.loadingPokemon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: height)
                        .shimmer()
                        
                }
                .offset(x: offset?.x ?? 0, y: offset?.y ?? 0)

            }
            if(pokemonBottomTitle != nil){
                Text(pokemonBottomTitle!)
                    .opacity(0.6)
                    .padding(.bottom, 4)
            }
        }
   
    }
}

#Preview {
    PokemonWithType(
        pokemonType: PokemonType.dark, pokemonImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"
    )
}
