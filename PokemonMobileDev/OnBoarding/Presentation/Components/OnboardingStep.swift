//
//  OnboardingStep.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 20/12/24.
//

import Foundation
import SwiftUICore

enum onBoardingStep: CaseIterable {
    case first
    case second
    case third

    static var filteredCases: [onBoardingStep] {
       return [first, second]
    }
    
    var image: String {
        switch self {
        case .first: return "on_boarding_page_1"
        case .second: return "on_boarding_page_2"
        case .third: return "on_boarding_page_3"
        }
    }

    var title: LocalizedStringKey {
        switch self {
        case .first:
            "onBoardingFirstPageTitle"
        case .second:
            "onBoardingSecondPageTitle"
        case .third:
            "onBoardingThirdPageTitle"
        }
    }
    
    var description: LocalizedStringKey {
        switch self {
        case .first:
            "onBoardingFirstPageDescription"
        case .second:
            "onBoardingSecondPageDescription"
        case .third:
            "onBoardingThirdPageDescription"
        }
    }
    
    var titleButton: LocalizedStringKey {
        switch self {
        case .first:
            "Continue"
        case .second:
            "Let’s start"
        case .third:
            "Create Account"
        }
    }

}
