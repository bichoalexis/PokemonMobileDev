//
//  OnboardingViewController.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 20/12/24.
//

import Foundation
import SwiftUI


class OnboardingViewController: ObservableObject {
    
    @AppStorage("isOnboardingComplete") var isOnboardingComplete: Bool = false
    @AppStorage("hasSkippedAuthentication") var hasSkippedAuthentication: Bool = false
    
    @Published var currentStep: onBoardingStep = .first
    
    func completeOnboarding() {
        isOnboardingComplete = true
    }
    
    func moveToNextStep() {
        switch currentStep {
        case .first:
            currentStep = .second
        case .second:
            completeOnboarding()
        case .third:
            completeOnboarding()
        }
    }
    
    
    func skipAuthentication() {
        hasSkippedAuthentication = true
        UserDefaults.standard.synchronize()
    }
}
