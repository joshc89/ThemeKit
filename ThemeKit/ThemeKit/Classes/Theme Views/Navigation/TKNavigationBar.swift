//
//  TKNavigationBar.swift
//  ThemeKit
//
//  Created by Josh Campion on 12/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

public class TKNavigationBar: UINavigationBar, BarThemeable, FontThemeable, TextColourThemeable, Checking {
    
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
    
    public var tintColourStyle:ColourStyle? {
        didSet {
            checkAndUpdateColourStyle(oldValue, tintColourStyle)
        }
    }
    
    /// Styles the font for this `UINavigationBar`'s `titleTextAttributes`.
    public var textStyle:TextStyle?  {
        didSet {
            checkAndUpdateTextStyle(oldValue, textStyle)
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
    
    /// Styles this `UINavigationBar`'s `barTintColor`.
    public var barTintColourStyle:ColourStyle?  {
        didSet {
            if oldValue != barTintColourStyle {
                setNeedsUpdateTheme()
            }
        }
    }
    
    public func applyFontTheme(theme: Theme) {
        // apply the title text attributes
        var attributes = self.titleTextAttributes ?? [String:AnyObject]()
        
        if let text = textStyle {
            attributes[NSFontAttributeName] = theme.font(text)
        }
        
        titleTextAttributes = attributes
    }
    
    public func applyTextColourTheme(theme: Theme) {
        // apply the title text attributes
        var attributes = self.titleTextAttributes ?? [String:AnyObject]()
        
        if let textColour = textColourStyle {
            attributes[NSForegroundColorAttributeName] = theme.colour(textColour)
        }
        
        titleTextAttributes = attributes
    }
    
    public func applyTheme(theme:Theme) {
        
        applyProtocolThemes(theme)
        
        // apply the theme to the navigation items colours
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