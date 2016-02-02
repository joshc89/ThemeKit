//
//  TKWindow.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

/**

 Global accessory for a single shared `Theme` to be used throughout the application.
 
 Each element in `ThemeKit` queries this shared instance for its theme. To specify a given `Theme` as the default `Theme`, users should subclass `TKThemeVendor` and override the `defaultTheme` variable. That subclass should be then be referenced before any view code is loaded. The simplest way to do this is to extend `TKThemeVendor` and override the `initialize()` func as given in `MyTheme.swift` template file.
*/
public class TKThemeVendor: NSSingleton, Checking {
    
    let checker = _Checker()
    
    /// The `Theme` that each `Themeable` component should style itself against.
    public var defaultTheme:Theme?
    
    /**
     
     Convenience accessor for the default font for a given `TextStyle`.
     
     - returns: Returns the result `font(_:sizeCategory:)` on the `defaultTheme` of the `shared() TKThemeVendor`.
    */
    public static func defaultFont(textStyle:TextStyle, sizeCategory:UIContentSizeCategory?) -> UIFont? {
      
        return TKThemeVendor.shared().defaultTheme?.font(textStyle, sizeCategory: sizeCategory)
    }
    
    /**
     
     Convenience accessor for the default colour for a given `ColourStyle`.
     
     - returns: Returns the result `colour(_:)` on the `defaultTheme` of the `shared() TKThemeVendor`.
     */
    public static func defaultColour(colourStyle:ColourStyle) -> UIColor? {
        return TKThemeVendor.shared().defaultTheme?.colour(colourStyle)
    }
}