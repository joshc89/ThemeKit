//
//  ThemeSwitch.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit
import ThemeKitCore

@IBDesignable
public class ThemeSwitch: TKSwitch, ThumbTintColourInspectable, IBThemeable {
    
    @IBInspectable public var thumbTintColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue: idString) {
                    thumbTintColourStyle = style
            }
        }
        get {
            return thumbTintColourStyle?.rawValue
        }
    }
    
    @IBInspectable public var onTintColourId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue: idString) {
                    onTintColourStyle = style
            }
        }
        get {
            return onTintColourStyle?.rawValue
        }
    }
}