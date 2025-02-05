//
//  TextWithIcon.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 03/02/25.
//

import SwiftUI

struct TextWithIcon: View {
    let icon: String
    let text: LocalizedStringKey


    init(icon: String, text: LocalizedStringKey) {
        self.icon = icon
        self.text = text
    }

    init(icon: String, text: String) {
        self.icon = icon
        self.text = LocalizedStringKey(text)
    }

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: icon)
            Text(text)
        }
        .opacity(0.6)
    }
}

#Preview {
    TextWithIcon(
        icon: "scalemass", text: "Peso"
    )
}
