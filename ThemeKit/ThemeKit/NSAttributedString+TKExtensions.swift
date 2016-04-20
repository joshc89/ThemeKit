//
//  NSAttributedString+TKExtensions.swift
//  ThemeKit
//
//  Created by Josh Campion on 20/04/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    public convenience init(string:String, textStyle:TextStyle, sizeCategory:UIContentSizeCategory? = nil, textColourStyle:ColourStyle, theme:Theme? = TKThemeVendor.shared().defaultTheme) {
        
        var attributes = [String: AnyObject]()
        
        attributes[NSFontAttributeName] = theme?.font(textStyle, sizeCategory: sizeCategory)
        attributes[NSForegroundColorAttributeName] = theme?.colour(textColourStyle)
        
        self.init(string: string, attributes: attributes)
    }
    
}