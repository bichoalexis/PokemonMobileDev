//
//  ColorExtension.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 17/12/24.
//

import SwiftUI

extension Color{
    static let primaryColor = Color("PrimaryColor")
    static let borderColor = Color("BorderColor")
    static let blackColor = Color("AllType")
    
    var contrastColor: Color {
           // Convertir el color a UIColor para obtener los componentes RGBA
           let uiColor = UIColor(self)
           var red: CGFloat = 0
           var green: CGFloat = 0
           var blue: CGFloat = 0
           var alpha: CGFloat = 0
           
           uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
           
           // Calcular la luminancia relativa
           let luminance = (0.299 * red + 0.587 * green + 0.114 * blue)
           
           // Devolver blanco o negro basado en la luminancia
           return luminance > 0.5 ? .black : .white
       }
    
    
}
