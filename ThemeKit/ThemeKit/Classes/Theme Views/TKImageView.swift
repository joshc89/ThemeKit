//
//  TKImageView.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public class TKImageView: UIImageView, BackgroundColourThemeable, TintColourThemeable {
    
     
    
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
    
    // MARK: Themeable Properties
    
    public var tintColourStyle:ColourStyle? {
        didSet {
            checkAndUpdateColourStyle(oldValue, tintColourStyle)
        }
    }
    
    public var backgroundColourStyle:ColourStyle? {
        didSet {
            checkAndUpdateColourStyle(oldValue, backgroundColourStyle)
        }
    }
    
    // MARK: Inspectable Properties
    
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

