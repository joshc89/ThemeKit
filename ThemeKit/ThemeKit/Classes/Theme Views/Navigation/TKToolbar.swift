//
//  TKToolbar.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public class TKToolbar: UIToolbar, BarThemeable, Checking {
    
    // let checker = _Checker()
    
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
            checkAndUpdateColourStyle(oldValue, tintColourStyle)
        }
    }
    
    public var barTintColourStyle:ColourStyle?  {
        didSet {
            checkAndUpdateColourStyle(oldValue, barTintColourStyle)
        }
    }
    
    // MARK: Inspectable Properties
    
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
    
    public var barTintColourStyleId:String? {
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

    // MARK: Theme Functions
    
    public func applyTheme(theme:Theme) {
        
        applyProtocolThemes(theme)
        
        if let tabItems = self.items {
            for item in tabItems {
                if let themedItem = item as? Themeable {
                    themedItem.applyTheme(theme)
                }
            }
        }
    }
}
