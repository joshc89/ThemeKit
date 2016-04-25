//
//  BarThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

/// Defines a protocol for objects that set bar colour separately to `backgroundColor` or `tintColour`. This includes `UINavigationBar`, `UITabBar` and `UIToolbar`. This allows protocol extensions to add functionality to multiple UIKit classes.
public protocol Bar: class {
    
    /// The colour of the objects 'bar', this differs from the `backgroundColor` and `tintColor`.
    var barTintColor:UIColor? { get set }
    
}

/// Protocol conformance to allow protocol extensions to give conformane to ThemeKit protocols.
extension UINavigationBar: Bar { }

/// Protocol conformance to allow protocol extensions to give conformane to ThemeKit protocols.
extension UITabBar: Bar { }

/// Protocol conformance to allow protocol extensions to give conformane to ThemeKit protocols.
extension UIToolbar: Bar { }

/// Theme protocol for objects that can style a bar, such as `UINavigationBar`, `UITabBar` and `UIToolbar`.
public protocol BarThemeable: TintColourThemeable {
    
    /// `ColourStyle` for the background colour of the bar. Corresponds to the `barTintColor` property.
    var barTintColourStyle:ColourStyle? { get set }
    
    /// Identifier property for `barTintColourStyle` that can be used in Storyboards if overriden to be IBInspectable.
    var barTintColourStyleId:String? { get set }
    
    /**
     
     Styles the `barTintColor` based on the `barTintColourStyle`.
     
     - parameter theme: The theme to get the colour from to apply the style.
     
    */
    func applyBarTheme(theme:Theme)
}


public extension BarThemeable where Self:Bar {
    
    /// Queries the given theme for the colour and assigns it to the `barTintColor` property.
    func applyBarTheme(theme:Theme) {
        if let style = barTintColourStyle {
            barTintColor = theme.colour(style)
        }
    }
    
}