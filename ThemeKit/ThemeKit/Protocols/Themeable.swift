//
//  Themeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 31/01/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit
import ObjectiveC

public protocol Themeable: class {
    
    var createdFromNib:Bool { get set }
    
    func theme() -> Theme?
    
    /// Sets properties based on *Themeable protocol properties. A default implementation is provided for `UIView`s.
    func applyTheme(theme:Theme)

    /// A default implementation is provided for `UIView`s.
    func setNeedsUpdateTheme()
    
    /// A default implementation is provided for `UIView`s.
    func updateThemeIfNeeded()
}

public extension Themeable {
    
    public func applyProtocolThemes(theme:Theme) {
        if let backgroundSelf = self as? BackgroundColourThemeable {
            backgroundSelf.applyBackgroundTheme(theme)
        }
        
        if let tintSelf = self as? TintColourThemeable {
            tintSelf.applyTintTheme(theme)
        }
        
        if let fontSelf = self as? FontThemeable {
            fontSelf.applyFontTheme(theme)
        }
        
        if let textColourSelf = self as? TextColourThemeable {
            textColourSelf.applyTextColourTheme(theme)
        }
        
        if let thumbSelf = self as? ThumbTintColourThemeable {
            thumbSelf.applyThumbTintTheme(theme)
        }
        
        if let barSelf = self as? BarThemeable {
            barSelf.applyBarTheme(theme)
        }
    }
    
    func applyTheme(theme:Theme) {
        applyProtocolThemes(theme)
    }
    
    func checkAndUpdateColourStyle(oldValue:ColourStyle?, _ newValue:ColourStyle?) {
        if (oldValue != newValue) {
            setNeedsUpdateTheme()
        }
    }
    
    func checkAndUpdateTextStyle(oldValue:TextStyle?, _ newValue:TextStyle?) {
        if (oldValue != newValue) {
            setNeedsUpdateTheme()
        }
    }
}

private var ThemeableNeedsUpdateThemeKey:UInt8 = 0

public extension Themeable where Self:UIView {
    
    func theme() -> Theme? {

        // to re-add when allowing multiple themes.
//        if let svTheme = (superview as? Themeable)?.theme() {
//            return svTheme
//        }
        
        let vendor = TKThemeVendor.shared()
        let theme = vendor.defaultTheme
        return theme
    }
    
    // private variable to support the `setNeedsUpdateTheme()` and `updateThemeIfNeeded()` extensions.
    private var _needsUpdateTheme:Bool {
        get {
            return (objc_getAssociatedObject(self, &ThemeableNeedsUpdateThemeKey) as? NSNumber)?.boolValue ?? true
        }
        set {
            objc_setAssociatedObject(self, &ThemeableNeedsUpdateThemeKey, NSNumber(bool: newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func setNeedsUpdateTheme() {
        _needsUpdateTheme = true
        setNeedsLayout()
    }
    
    public func updateThemeIfNeeded() {
        if _needsUpdateTheme {
            if let t = self.theme() {
                self.applyTheme(t)
            }
            _needsUpdateTheme = false
        }
    }
}