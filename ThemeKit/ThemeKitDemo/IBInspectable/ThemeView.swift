//
//  ThemeView.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit
import ThemeKitCore

@IBDesignable
public class ThemeView: TKView, BackgroundColourInspectable, TintColourInspectable, IBThemeable {
    
    // Only instance properties can be declared IBInspectable
    @IBInspectable
    public var backgroundColourStyleId:String? {
        get {
            return backgroundColourStyle?.rawValue
        }
        set {
            if let rawValue = newValue,
                let style = ColourStyle(rawValue: rawValue) {
                    backgroundColourStyle = style
            } else {
                backgroundColourStyle = nil
            }
        }
    }
    
    // Only instance properties can be declared IBInspectable
    @IBInspectable
    public var tintColourStyleId:String? {
        get {
            return tintColourStyle?.rawValue
        }
        set {
            if let rawValue = newValue,
                let style = ColourStyle(rawValue: rawValue) {
                    tintColourStyle = style
            } else {
                tintColourStyle = nil
            }
        }
    }
    
}