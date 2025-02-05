//
//  IgnoreShortDrags.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 28/01/25.
//

import Foundation
import SwiftUI

extension View {
    func ignoreShortDrags(minimumDistance: CGFloat = 10) -> some View {
        self.gesture(
            DragGesture(minimumDistance: minimumDistance)
                .onChanged { _ in }
                .onEnded { _ in }
        )
    }
}
