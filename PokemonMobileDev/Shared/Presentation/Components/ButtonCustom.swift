//
//  ButtonCustom.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 17/12/24.
//

import SwiftUI

struct ButtonCustom: View {
    var onPress: () -> Void
    var title: LocalizedStringKey
    
    var body: some View {
        Button(action: onPress) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primaryColor)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
        }
    }
}

#Preview {
    ButtonCustom(
        onPress: {},
        title: "buttonTitle"
    )
}
