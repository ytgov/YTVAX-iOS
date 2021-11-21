//
//  UIFont+Ext.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 02/11/21.
//

import UIKit

internal extension UIFont {
    enum ThemeStyle: String {
        case regular = "Montserrat-Regular"
        case medium = "Montserrat-Medium"
        case italic = "Montserrat-Italic"
        case boldItalic = "Montserrat-BoldItalic"
        case bold = "Montserrat-Bold"
    }
    
    static func themeFont(size: CGFloat, style: ThemeStyle = .regular) -> UIFont {
        UIFont(name: style.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
