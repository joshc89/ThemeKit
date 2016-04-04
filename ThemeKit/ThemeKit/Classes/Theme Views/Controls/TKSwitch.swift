//
//  TKSwitch.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

@IBDesignable
public class TKSwitch:UISwitch, Themeable, ThumbTintColourThemeable, Checking {
    
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
    
    // MARK: - Properties
    
    
    // MARK: - Theme Properties
    
    public var thumbTintColourStyle:ColourStyle?  {
        didSet {
            checkAndUpdateColourStyle(oldValue, thumbTintColourStyle)
        }
    }
    
    // MARK: Custom Theme Properties
    
    public var onTintColourStyle:ColourStyle?  {
        didSet {
            if oldValue != onTintColourStyle {
                setNeedsUpdateTheme()
            }
        }
    }
    
    public func applyTheme(theme: Theme) {
        
        applyProtocolThemes(theme)
        
        if let style = onTintColourStyle {
                onTintColor = theme.colour(style)
        }
    }
    
    
}