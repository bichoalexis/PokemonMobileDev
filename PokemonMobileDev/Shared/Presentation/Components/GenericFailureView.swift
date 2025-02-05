//
//  GenericFailureView.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 23/01/25.
//

import SwiftUI

struct GenericFailureView: View {
    let error: Error?
    var body: some View {
        VStack(alignment: .center){
            Text("Error: \(error?.localizedDescription ?? "Unknown error")")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
        
}
