//
//  NSAttributedString+TKExtensions.swift
//  ThemeKit
//
//  Created by Josh Campion on 20/04/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /**
     
     Convenience initialiser for creating an `NSAttributedString` with ThemeKit styles. Calls `self.init(string:attributes:)`.
     
     - parameter string: The text for this attributed string.
     - parameter textStyle: The style that defines the font. Sets the `NSFontAttributeName` in the `attributes` dictionary.
     - parameter sizeCategory: The specific `UIContentSizeCategory` that the font should be created at. `nil` implies the user's current `UIContentSizeCategory` will be used. Default value is `nil`.
     - parameter textColourStyle: The text colour for this attributed string. Sets the `NSForegroundColorAttributeName` in the `attributes` dictionary.
     - parameter theme: The `Theme` to get the text and colour styles from. Default value is the `defaultTheme` of the current `TKThemeVendor`.
    */
    public convenience init(string:String, textStyle:TextStyle, sizeCategory:UIContentSizeCategory? = nil, textColourStyle:ColourStyle, theme:Theme? = TKThemeVendor.shared().defaultTheme) {
        
        var attributes = [String: AnyObject]()
        
        attributes[NSFontAttributeName] = theme?.font(textStyle, sizeCategory: sizeCategory)
        attributes[NSForegroundColorAttributeName] = theme?.colour(textColourStyle)
        
        self.init(string: string, attributes: attributes)
    }
    
}