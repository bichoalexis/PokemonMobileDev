//
//  Search.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 22/01/25.
//

import SwiftUI

struct Search: View {
    var text: Binding<String>
    var onChange: ((String) -> Void)
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            TextField(StringConstants.General.searchPokemon, text: text)
                .onChange(of: text.wrappedValue ){
                    onChange(text.wrappedValue)
                }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .overlay( RoundedRectangle(cornerRadius: 40) // Border shape
            .stroke(Color.borderColor, lineWidth: 1) )
       
    }
}

#Preview {
    @Previewable @State var previewText = ""
    Search(text: $previewText) { value in
        print(value)
    }
}
