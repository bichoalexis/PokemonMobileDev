//
//  FilterButton.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 23/01/25.
//

import SwiftUI

struct FilterButton: View {

    /// If non-nil, the text is a localized key.
    private let textKey: LocalizedStringKey?

    /// If non-nil, the text is a simple string.
    private let textString: String?
    var action: @MainActor () -> Void
    var color: Color
    var isExpanded: Bool
    var hasArrow: Bool

    init(
        _ title: LocalizedStringKey,
        isExpanded: Bool = false,
        hasArrow: Bool = false,
        color: Color = Color.blackColor,
        action: @escaping @MainActor () -> Void
    ) {
        self.textKey = title
        self.textString = nil
        self.action = action
        self.hasArrow = hasArrow
        self.color = color
        self.isExpanded = isExpanded
    }

    init(
        title: String,
        isExpanded: Bool = false,
        hasArrow: Bool = false,
        color: Color = Color.blackColor,
        action: @escaping @MainActor () -> Void
    ) {
        self.textKey = nil
        self.textString = title
        self.action = action
        self.hasArrow = hasArrow
        self.color = color
        self.isExpanded = isExpanded
    }

    var body: some View {
        Button(
            action: action,
            label: {
                HStack {
                    if let key = textKey {
                        Text(key)
                            .fontWeight(.bold)
                    } else if let string = textString {
                        Text(string)
                            .fontWeight(.bold)
                    }
                    if hasArrow {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 16, weight: .bold))
                    }

                }
                .padding(.vertical, 9)
                .padding(.horizontal, 16)
                .frame(maxWidth: isExpanded ? .infinity : nil)
                .background {
                    Capsule()
                        .fill(color)
                }
            }
        )
        .foregroundStyle(color.contrastColor)

    }
}

#Preview {
    FilterButton("AllTypes") {

    }
}
