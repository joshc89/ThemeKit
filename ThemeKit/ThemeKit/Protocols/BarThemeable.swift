//
//  BarThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public protocol Bar: class {
    
    var barTintColor:UIColor? { get set }
    
}

extension UINavigationBar: Bar { }
extension UITabBar: Bar { }
extension UIToolbar: Bar { }

public protocol BarThemeable: TintColourThemeable {
    
    var barTintColourStyle:ColourStyle? { get set }
    
    func applyBarTheme(theme:Theme)
}

public extension BarThemeable where Self:Bar {
    
    func applyBarTheme(theme:Theme) {
        if let style = barTintColourStyle {
            barTintColor = theme.colour(style)
        }
    }
    
}

public protocol BarInspectable: BarThemeable {
    
    var barTintColourStyleId:String? { get set }

}