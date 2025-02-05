//
//  CustomTab.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 06/01/25.
//

import SwiftUI

struct CustomTabLabel: View {
    let title: String
    let isSelected: Bool
    let activeImage: String
    let inactiveImage: String

    var body: some View {
        VStack {
            Image(isSelected ? activeImage : inactiveImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            Text(title)
        }
    }
}

