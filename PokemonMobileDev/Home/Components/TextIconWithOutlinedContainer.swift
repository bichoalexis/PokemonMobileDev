//
//  TextIconWithOutlinedContainer.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 03/02/25.
//

import SwiftUI

struct TextIconWithOutlinedContainer: View {
    let icon: String
    let title: LocalizedStringKey
    let value: String
    
    var body: some View {
        VStack(alignment: .leading){
            TextWithIcon(icon: icon, text: title)
            Text(value)
                .font(.system(size: 18, weight: .medium))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            
        }
    }
}

#Preview {
    TextIconWithOutlinedContainer(
        icon: "scalemass", title: "Peso",value: "6,9 kg"
    )
}
