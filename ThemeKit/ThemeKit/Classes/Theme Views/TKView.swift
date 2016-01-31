//
//  TKView.swift
//  ThemeKit
//
//  Created by Josh Campion on 31/01/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

@IBDesignable
public class TKView: UIView, Themeable, Checking {
    
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
    
    public var backgroundColourStyle:ColourStyle? {
        didSet {
            if oldValue != backgroundColourStyle {
                setNeedsUpdateTheme()
            }
        }
    }
    
    @IBInspectable public var backgroundColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue:idString) {
                    backgroundColourStyle = style
            }
        }
        get {
            return backgroundColourStyle?.rawValue
        }
    }
    
    public func applyTheme(theme:Theme) {
        
        if let bgStyle = backgroundColourStyle {
            backgroundColor = theme.colour(bgStyle)
        } else {
            backgroundColor = UIColor.whiteColor()
        }
    }
}

