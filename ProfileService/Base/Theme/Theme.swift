//
//  AppTheme.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 19.01.2021.
//

import UIKit


struct Theme {
    enum `Type` {
        case light
        case dark
    }
    
    var type: Type
    var colors: ColorPalette
}

extension Theme {
    static let light = Theme(type: .light, colors: .init(backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), labelColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
    static let dark = Theme(type: .dark, colors: .init(backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), labelColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
}
