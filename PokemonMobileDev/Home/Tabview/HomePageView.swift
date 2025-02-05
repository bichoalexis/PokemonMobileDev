//
//  HomeView.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 18/12/24.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var homeTabViewController = HomeTabViewController()
    
    
    var body: some View {
        let selectedTab: HomeTab = homeTabViewController.selectedTab
        TabView(
            selection: $homeTabViewController.selectedTab
        ) {
            PokedexTabView()
                .tabItem {
                    CustomTabLabel(
                        title: "Pokedex",
                        isSelected: selectedTab == HomeTab.pokedex,
                        activeImage: "pokedex_icon_tab_on",
                        inactiveImage: "pokedex_icon_tab_off"
                    )
                }
                .tag(
                    HomeTab.pokedex
                )
            FavoritesTabView()
                .tabItem {
                    CustomTabLabel(
                        title: "Favorites",
                        isSelected: selectedTab == HomeTab.favorites,
                        activeImage: "favorites_icon_tab_on",
                        inactiveImage: "favorites_icon_tab_off"
                    )
                }
                .tag(
                    HomeTab.favorites
                )
            ProfileTabView()
                .tabItem {
                    CustomTabLabel(
                        title: "Profile",
                        isSelected: selectedTab == HomeTab.profile,
                        activeImage: "profile_icon_tab_on",
                        inactiveImage: "profile_icon_tab_off"
                    )
                }
                .tag(
                    HomeTab.profile
                )
            
        }
    }
}

#Preview {
    HomePageView()
}
