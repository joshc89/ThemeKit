//
//  TKTabBarItem.swift
//  ThemeKit
//
//  Created by Josh Campion on 31/01/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation


@IBDesignable
public class TKTabBarItem: UITabBarItem, Themeable, Checking {
    
    let checker = _Checker()
    
    // - initWithFrame(_:) support
    public var createdFromNib:Bool = false
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        createdFromNib = true
    }
    
    // MARK: Themeable
    
    public func theme() -> Theme? {
        return TKThemeVendor.shared().defaultTheme
    }
    
    private var _needsUpdateTheme:Bool = true
    
    public func setNeedsUpdateTheme() {
        _needsUpdateTheme = true
    }
    
    public func updateThemeIfNeeded() {
        
    }
    
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
    
    public func applyTheme(theme:Theme) {
        
        if let text = textStyle {
            var attributes = self.titleTextAttributesForState(.Normal) ?? [String:AnyObject]()
            attributes[NSFontAttributeName] = theme.font(text)
            setTitleTextAttributes(attributes, forState: .Normal)
        }
    }
}
