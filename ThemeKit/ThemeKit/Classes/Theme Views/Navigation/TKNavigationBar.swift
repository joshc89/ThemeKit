//
//  TKNavigationBar.swift
//  ThemeKit
//
//  Created by Josh Campion on 12/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

public class TKNavigationBar: UINavigationBar, Themeable, Checking {
    
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
    
    /// Styles the font for this `UINavigationBar`'s `titleTextAttributes`.
    public var textStyle:TextStyle?  {
        didSet {
            if oldValue != textStyle {
                setNeedsUpdateTheme()
            }
        }
    }
    
    @IBInspectable public var textStyleId:String? {
        set {
            if let idString = newValue,
                let style = TextStyle(rawValue:idString) {
                    textStyle = style
            }
        }
        get {
            return textStyle?.rawValue
        }
    }
    
    /// Styles the font colour for this `UINavigationBar`'s `titleTextAttributes`.
    public var textColourStyle:ColourStyle?  {
        didSet {
            if oldValue != textColourStyle {
                setNeedsUpdateTheme()
            }
        }
    }

    @IBInspectable public var textColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue:idString) {
                    textColourStyle = style
            }
        }
        get {
            return textColourStyle?.rawValue
        }
    }
    
    /// Styles this `UINavigationBar`'s `tintColor`.
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
    
    /// Styles this `UINavigationBar`'s `barTintColor`.
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
        
        // apply the title text attributes
        var attributes = self.titleTextAttributes ?? [String:AnyObject]()
        
        if let text = textStyle {
            attributes[NSFontAttributeName] = theme.font(text)
        }
        
        if let textColour = textColourStyle {
            attributes[NSForegroundColorAttributeName] = theme.colour(textColour)
        }
        
        titleTextAttributes = attributes
        
        // apply the tint colours
        
        if let colour = tintColourStyle {
            tintColor = theme.colour(colour)
        }
        
        if let colour = barTintColourStyle {
            barTintColor = theme.colour(colour)
        }
        
        if let navItems = self.items {
            for item in navItems {
                
                var allBarItems = [UIBarButtonItem]()
                
                if let left = item.leftBarButtonItems {
                    allBarItems += left
                }

                if let left = item.leftBarButtonItem {
                    allBarItems.append(left)
                }
                
                if let right = item.rightBarButtonItems {
                    allBarItems += right
                }
                
                if let right = item.rightBarButtonItem {
                    allBarItems.append(right)
                }
                
                for barItem in allBarItems {
                    if let themedItem = barItem as? Themeable {
                        themedItem.applyTheme(theme)
                    }
                }
            }
        }
    }
}