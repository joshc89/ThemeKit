//
//  TKImageView.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public protocol TintColourThemeable: Themeable {
    
    var tintColourStyle:ColourStyle? { get set }
    
    var tintColourStyleId:String? { get set }
    
    func applyTintTheme(theme:Theme)
}

// TODO: Is this simplicity worth the performance decrease?

public extension TintColourThemeable where Self:UIView {
    
    public var tintColourStyle:ColourStyle? {
        get {
            if let str = tintColourStyleId {
                return ColourStyle(rawValue: str)
            } else {
                return nil
            }
        }
        set {
            tintColourStyleId = newValue?.rawValue
        }
    }
    
    public func applyTintTheme(theme: Theme) {
        if let tintStyle = tintColourStyle {
            tintColor = theme.colour(tintStyle)
        }
    }
}

@IBDesignable
public class TKImageView: UIImageView, TintColourThemeable, BackgroundColourThemeable, Checking {
    
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
    @IBInspectable public var tintColourStyleId:String? {
        didSet {
            if tintColourStyleId != oldValue {
                setNeedsUpdateTheme()
            }
        }
    }
    
    @IBInspectable public var backgroundColourStyleId:String? {
        didSet {
            if backgroundColourStyleId != oldValue {
                setNeedsUpdateTheme()
            }
        }
    }
}

