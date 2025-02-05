//
//  SelectOrderSheet.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 24/01/25.
//

import SwiftUI



struct SelectOrderSheet: View {
    var onFilterButtonSelection: (OrderType) -> Void
    var body: some View {
        VStack{
            Text("SelectOrder")
                .fontWeight(.bold)
                .padding(.bottom, 12)
                .padding(.top, 24)
            ForEach(OrderType.allCases, id: \.hashValue){ type in
                FilterButton(type.name, isExpanded: true) {
                    onFilterButtonSelection(type)
                }
                .padding(.top, 12)
            }
            
        }
        .frame(alignment: .top)
        .padding(.horizontal, 24)
    }
}

#Preview {
    SelectOrderSheet { type in
        
    }
}


