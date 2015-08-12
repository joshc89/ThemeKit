//
//  TKButton.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import Foundation

@IBDesignable
public class TKButton: UIButton, Themeable {
    
    var tintColourStyle:ColourStyle?
    var textStyle:TextStyle?
    
    @IBInspectable var textStyleId:String? {
        set {
            if let idString = newValue,
                let style = TextStyle(rawValue:idString) {
                    textStyle = style
            }
        }
        get {
            return textStyle?.rawValue
        }
    }
    
    @IBInspectable var tintColourId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue:idString) {
                    tintColourStyle = style
            }
        }
        get {
            return tintColourStyle?.rawValue
        }
    }
    
    func applyTheme(theme:Theme) {
        
        if let colour = tintColourStyle {
            tintColor = theme.colour(colour)
        }
        
        if let text = textStyle {
            titleLabel?.font = theme.font(text)
        }
    }
}