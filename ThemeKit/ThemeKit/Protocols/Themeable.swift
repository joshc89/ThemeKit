//
//  Themeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 31/01/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation
import ObjectiveC

public protocol Themeable: class {
    
    var createdFromNib:Bool { get set }
    
    func theme() -> Theme?
    
    func applyTheme(theme:Theme)
    
    func setNeedsUpdateTheme()
    
    func updateThemeIfNeeded()
    
}

public extension Themeable {
    
    func applyTheme(theme:Theme) {
        
        if let textSelf = self as? ThemeableText {
            textSelf.applyTextTheme(theme)
        }
    }
}

private var ThemeableNeedsUpdateThemeKey:UInt8 = 0

public extension Themeable where Self:UIView {
    
    func theme() -> Theme? {
        
        // TODO: Allow a UIView to have a theme, which overrides the window's theme
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