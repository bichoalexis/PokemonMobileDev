//
//  LetsStartPageView.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 18/12/24.
//

import SwiftUI

struct LetsStartPageView: View {
    @ObservedObject private var onboardingViewControler = OnboardingViewController()
    
    var body: some View {
        VStack{
            Button{
                onboardingViewControler.skipAuthentication()
            } label: {
                HStack{
                    Text("Skip")
                    Image(systemName: "arrow.right")
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 16)
            Spacer()
            OnBoardingView(stepNumber: .third)
                .tag(onBoardingStep.third)
            Spacer()
            ButtonCustom(onPress: {
                
                
            }, title: onBoardingStep.third.titleButton)
            .padding(.top, 24)
            .padding(.horizontal, 16)
            Button("I already have an account") {
                
            }
            .foregroundStyle(Color.primaryColor)
            .padding()
        
        }
        
        
        
    }
}

#Preview {
    LetsStartPageView()
}
