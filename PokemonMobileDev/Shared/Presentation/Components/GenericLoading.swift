//
//  GenericLoading.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 23/01/25.
//

import SwiftUI

struct GenericLoading: View {
    let loadingMessage: String
    var body: some View {
        VStack(alignment: .center){
            ProgressView(loadingMessage)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
        
}


