//
//  ThemeSlider.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit
import ThemeKitCore

@IBDesignable
public class ThemeSlider: TKSlider, ThumbTintColourInspectable, IBThemeable {
    
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
    
    @IBInspectable public var minimumTrackTintColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue: idString) {
                    minimumTrackTintColourStyle = style
            }
        }
        get {
            return minimumTrackTintColourStyle?.rawValue
        }
    }
    
    @IBInspectable public var maximumTrackTintColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue: idString) {
                    maximumTrackTintColourStyle = style
            }
        }
        get {
            return maximumTrackTintColourStyle?.rawValue
        }
    }
}