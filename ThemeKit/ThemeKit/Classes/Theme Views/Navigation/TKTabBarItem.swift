//
//  TKTabBarItem.swift
//  ThemeKit
//
//  Created by Josh Campion on 31/01/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

@IBDesignable
public class TKTabBarItem: UITabBarItem, TextThemeable, Checking {
    
    // let checker = _Checker()
    
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
            checkAndUpdateTextStyle(oldValue, textStyle)
        }
    }
    
    public var textColourStyle:ColourStyle?  {
        didSet {
            checkAndUpdateColourStyle(oldValue, textColourStyle)
        }
    }
    
    // MARK: Inspectable Properties
    
    public var textStyleId:String? {
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
    
    public var textColourStyleId:String? {
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

}
