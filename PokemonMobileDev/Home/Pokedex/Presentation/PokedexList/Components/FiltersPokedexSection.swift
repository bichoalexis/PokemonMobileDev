//
//  FilterPokedexSection.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 24/01/25.
//

import SwiftUI

struct FiltersPokedexSection: View {
    @State private var isOrderSheetPresented: Bool = false
    @State private var isTypeSheetPresented: Bool = false
    @ObservedObject var viewModel: PokedexTabViewModel
    private var typeButtonName: String {
        if case let .byType(pokemonType) = viewModel.filterType {
            return pokemonType.name
        }
        return "All Types"
    }
    
    private var typeButtonColor: Color {
        if case let .byType(pokemonType) = viewModel.filterType {
            return pokemonType.color
        }
        return Color.blackColor
    }
       

    private var orderButtonName: LocalizedStringKey {
        if case let .byOrder(orderType) = viewModel.filterType {
            return orderType.name
        }
        return "SmallestNumber"
    }
    
    var body: some View {
        
        
        HStack(spacing: 16){
            FilterButton(
                title: typeButtonName,
                isExpanded: true,
                hasArrow: true,
                color: typeButtonColor
            ){
                isTypeSheetPresented = true
            }
            FilterButton(orderButtonName, isExpanded: true, hasArrow: true) {
                isOrderSheetPresented = true
            }
        }
        .sheet(isPresented: $isOrderSheetPresented) {
            SelectOrderSheet(onFilterButtonSelection: { type in
                viewModel.setFilterType(.byOrder(type))
                isOrderSheetPresented = false
            })
            .presentationDetents([.fraction(0.4)])
            .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $isTypeSheetPresented) {
            SelectTypeSheet(onFilterButtonSelection: { type in
                viewModel.setFilterType(.byType(type))
                isTypeSheetPresented = false
            })
            .presentationDetents([.medium,.large])
            .presentationDragIndicator(.visible)
        }
    }
}


