//
//  OnBoardingFirstView.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 17/12/24.
//

import SwiftUI



struct OnBoardingView: View {
    var stepNumber: onBoardingStep

    var body: some View {
//        let _ = Self._printChanges()
        VStack {
        
            Image(stepNumber.image).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text(stepNumber.title)
                .font(.title)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .padding(.horizontal, 40)
            Text(stepNumber.description)
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .multilineTextAlignment(.center)

        }
    }
}

#Preview {
    OnBoardingView(stepNumber: .third)
}
