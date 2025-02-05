//
//  OnBoardingPage.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 17/12/24.
//

import SwiftUI

struct OnBoardingPage: View {
    @StateObject private var onboardingViewController: OnboardingViewController = OnboardingViewController()
    
    
    var body: some View {
        VStack {
            // TabView with swipe animation
            TabView(selection: $onboardingViewController.currentStep, content: {
                OnBoardingView(stepNumber: .first)
                    .ignoresSafeArea()
                    .tag(onBoardingStep.first)
                OnBoardingView(stepNumber: .second)
                    .ignoresSafeArea()
                    .tag(onBoardingStep.second)
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Custom page indicators with animation
            HStack {
                ForEach(onBoardingStep.filteredCases, id: \.self) { page in
                    if page == onboardingViewController.currentStep {
                        Capsule(style: .circular)
                            .frame(width: 40, height: 10)
                            .foregroundColor(.primaryColor)
                            
                    } else {
                        Circle()
                            .fill(.gray)
                            .frame(width: 10, height: 10)
                    }
                }
            }
            
            // Button to navigate to the next page
            ButtonCustom(onPress: {
                withAnimation {
                    onboardingViewController.moveToNextStep()
                }
              
            }, title: onboardingViewController.currentStep.titleButton)
            .padding(.top, 24)
            .padding(.horizontal, 16)
        }
    }
    
}

