//
//  HalfCircle.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 29/01/25.
//

import SwiftUI

struct HalfCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        // Arc from 0° to 180° draws the bottom half of a circle.
        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(0),
            endAngle: .degrees(180),
            clockwise: false
        )
        
        
        return path
    }
}

#Preview {
    HalfCircle()
}
