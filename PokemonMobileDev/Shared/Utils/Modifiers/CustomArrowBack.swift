//
//  CustomArrowBack.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 29/01/25.
//

import Foundation
import SwiftUICore
import SwiftUI


struct CustomArrowBack: ViewModifier {
    @Environment(\.presentationMode) private var presentationMode
    
    func body(content: Content) -> some View {
        content.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.black)
                    }
                }
            }
    }
}

extension View {
    func customArrowBack() -> some View {
        self.modifier(CustomArrowBack())
    }
}
