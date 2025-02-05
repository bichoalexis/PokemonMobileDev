//
//  SelectTypeSheet.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 24/01/25.
//

import SwiftUI

struct SelectTypeSheet: View {
    var onFilterButtonSelection: (PokemonType) -> Void
    var body: some View {
        ScrollView{
            Text("SelectType")
                .fontWeight(.bold)
                .padding(.top, 24)
                .padding(.bottom, 20)
            ForEach (PokemonType.allCases, id: \.name) { type in
                FilterButton(
                    title: type.name,
                    isExpanded: true,
                    color: type.color
                ){
                    onFilterButtonSelection(type)
                }
                .padding(.top, 6)
            }
        }
        .ignoreShortDrags()
        .padding(.horizontal, 16)
    }
}

#Preview {
    SelectTypeSheet { type in
        
    }
}

