//
//  MyTheme.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit
import ThemeKitCore

// Define your app specific theme

struct MyTheme: Theme {
    
    let defaultTextSizes = MaterialTextSizes // default
    let textSizeAdjustments = AppleFontAdjustments // default
    
    let themeColours:[ColourStyle:UIColor] = [
        .Accent: UIColor.yellowColor(),
        .Main: UIColor.redColor(),
        .Text: UIColor.blackColor().colorWithAlphaComponent(0.87),
        .SecondaryText: UIColor.blackColor().colorWithAlphaComponent(0.54),
        .LightText: UIColor.whiteColor().colorWithAlphaComponent(0.87),
        .SecondaryLightText: UIColor.whiteColor().colorWithAlphaComponent(0.54),
    ]
    
    func fontName(textStyle:TextStyle) -> String {
        
        switch textStyle {
        case .Display4:
            return "HelveticaNeue-Light"
        case .Display3, .Display2, .Display1, .Headline, .SubHeadline, .Body1, .Caption:
            return "HelveticaNeue"
        case .Title, .Body2, .Button:
            return "HelveticaNeue-Medium"
        default:
            let defaultFontName = UIFont.preferredFontForTextStyle(UIFontTextStyleBody).fontName
            print("No text name specified for text style \"\(textStyle.rawValue)\". Using default \"\(defaultFontName)\".")
            return defaultFontName
        }
    }
}

// Create a vendor...

class MyVendor: TKThemeVendor {
    
    private var _defaultTheme:Theme? = MyTheme()
    
    override var defaultTheme:Theme? {
        get {
            return _defaultTheme
        }
        set {
            _defaultTheme = newValue
        }
    }
}

// ... and assign it as the default vendor
extension TKThemeVendor {
    
    override public class func initialize() {
        
        
        if self == TKThemeVendor.self {
            ThemeKit.setLicenseKey("Demo")
            assert(MyVendor.shared().defaultTheme != nil)
        }
        
        super.initialize()
    }
}

// Extend to return your Theme for Interface Builder
extension IBThemeable {
    
    public func ibTheme() -> Theme? {
        return MyTheme()
    }
}
