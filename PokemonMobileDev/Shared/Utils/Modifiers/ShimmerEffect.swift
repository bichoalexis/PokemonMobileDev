//
//  ShimmerEffect.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 21/01/25.
//

import Foundation
import SwiftUI

struct ShimmerEffect: ViewModifier {
    @State private var shimmerStartPoint: UnitPoint = .init(x: -2.0, y: -1.2)
    @State private var shimmerEndPoint: UnitPoint = .init(x: 0, y: -0.25)

    private let shimmerGradientColors = [
        Color(UIColor.systemGray5),
        Color(UIColor.systemGray4),
        Color(UIColor.systemGray5),
    ]

    func body(content: Content) -> some View {
        content
            .overlay {
                LinearGradient(
                    colors: shimmerGradientColors,
                    startPoint: shimmerStartPoint,
                    endPoint: shimmerEndPoint
                )
                .mask(content)
                .task { @MainActor in
                    shimmerStartPoint = .init(x: 1, y: 1)
                    shimmerEndPoint = .init(x: 2.15, y: 2.15)
                }
                .animation(
                    .linear(duration: 1.0).repeatForever(autoreverses: false),
                    value: shimmerStartPoint
                )
            }
    }
}

extension View {
    @ViewBuilder
    func shimmer(isActive: Bool = true) -> some View {
        if isActive {
            self.modifier(ShimmerEffect())
        } else {
            self
        }
    }
}
