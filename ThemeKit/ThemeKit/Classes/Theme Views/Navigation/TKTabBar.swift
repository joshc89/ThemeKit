//
//  TKTabBar.swift
//  ThemeKit
//
//  Created by Josh Campion on 12/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

public class TKTabBar: UITabBar, Themeable, Checking {
    
    let checker = _Checker()
    
    // - initWithFrame(_:) support
    public var createdFromNib:Bool = false
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        createdFromNib = true
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let theme = theme() where !createdFromNib {
            applyTheme(theme)
        }
    }
    
    // --
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        updateThemeIfNeeded()
    }
    
    // MARK: - Themeable Properties
    
    
    public var tintColourStyle:ColourStyle?  {
        didSet {
            if oldValue != tintColourStyle {
                setNeedsUpdateTheme()
            }
        }
    }
    
    @IBInspectable public var tintColourStyleId:String? {
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
    
    public var barTintColourStyle:ColourStyle?  {
        didSet {
            if oldValue != barTintColourStyle {
                setNeedsUpdateTheme()
            }
        }
    }
    
    @IBInspectable public var barTintColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue:idString) {
                    barTintColourStyle = style
            }
        }
        get {
            return barTintColourStyle?.rawValue
        }
    }
    
    public func applyTheme(theme:Theme) {
        
        if let colour = tintColourStyle {
            tintColor = theme.colour(colour)
        }
        
        if let colour = barTintColourStyle {
            barTintColor = theme.colour(colour)
        }
        
        if let tabItems = self.items {
            for item in tabItems {
                if let themedItem = item as? Themeable {
                    themedItem.applyTheme(theme)
                }
            }
        }
    }
}
