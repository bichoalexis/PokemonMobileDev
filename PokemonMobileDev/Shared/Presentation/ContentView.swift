//
//  ContentView.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var router = Router()
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    @AppStorage("hasSkippedAuthentication") private var hasSkippedAuthentication: Bool = false
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
           
            Group {
                if  isOnboardingComplete && hasSkippedAuthentication  {
                    HomePageView()
                } else if isOnboardingComplete && !hasSkippedAuthentication {
                    LetsStartPageView()
                } else {
                    OnBoardingPage()
                }
            }
            .navigationDestination(for: Router.Destination.self) { destination in
                switch destination {
                case .letsStart: LetsStartPageView()
                case .homePage: HomePageView()
                case .createAccount:
                    HomePageView()
                case .login:
                    HomePageView()
                case .pokemonDetails(let pokemonId):
                    PokemonDetails(pokemonId: pokemonId)
                }
            }
            .environmentObject(router)
            .onAppear() {
                printBooleans()
            }
        }
    }
    private func printBooleans() {
          print("isOnboardingComplete: \(isOnboardingComplete), hasSkippedAuthentication: \(hasSkippedAuthentication)")
      }
}

#Preview {
    ContentView()
}

