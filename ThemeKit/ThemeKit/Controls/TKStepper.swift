//
//  TKStepper.swift
//  ThemeKit
//
//  Created by Josh Campion on 12/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

public class TKStepper: UIStepper, Themeable {

    public var tintColourStyle:ColourStyle?
    
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
    }
}
