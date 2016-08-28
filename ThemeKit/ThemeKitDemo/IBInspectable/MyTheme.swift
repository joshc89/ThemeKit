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
    
    /// Light weight San Fransico font for use on iOS 9+
    let thinSFFont = ".SFUIText-Light"
    
    /// Regular weight San Fransico font for use on iOS 9+
    let normalSFFont = ".SFUIText-Regular"
    
    /// Medium weight Regular San Fransico font for use on iOS 9+
    let mediumSFFont = ".SFUIText-Semibold"
    
    /// Light weight Helvetica Neue font for use on iOS 8-
    let thinHFont = "HelveticaNeue-Light"
    
    /// Regular weight Helvetica Neue font for use on iOS 8-
    let normalHFont = "HelveticaNeue"
    
    /// Medium weight Helvetica Neue font for use on iOS 8-
    let mediumHFont = "HelveticaNeue-Medium"
    
    /// Use the default text sizes as standard
    let defaultTextSizes = MaterialTextSizes // default
    
    /// Use the Apple standard font adjustmentst to give consistent user experience for users with adjusted accessibility settings.
    let textSizeAdjustments = AppleFontAdjustments // default
    
    // Swap These for the colours in you app
    let themeColours:[ColourStyle:UIColor] = [.Accent: UIColor.yellowColor(),
                                              .Main: UIColor.redColor(),
                                              .Text: UIColor.blackColor().colorWithAlphaComponent(0.87),
                                              .SecondaryText: UIColor.blackColor().colorWithAlphaComponent(0.54),
                                              .LightText: UIColor.whiteColor().colorWithAlphaComponent(0.87),
                                              .SecondaryLightText: UIColor.whiteColor().colorWithAlphaComponent(0.54),
                                              ]
    
    /// Use standard iOS sans-serif fonts.
    func fontName(textStye:TextStyle) -> String {
        
        let thinFont:String
        let normalFont:String
        let mediumFont:String
        
        if #available(iOS 9, * ) {
            thinFont = thinSFFont
            normalFont = normalSFFont
            mediumFont = mediumSFFont
        } else {
            thinFont = thinHFont
            normalFont = normalHFont
            mediumFont = mediumHFont
        }
        
        // --- Replace these values to return branded fonts if applicable.
        switch textStye {
        case .Display4:
            return thinFont
        case .Display3, .Display2, .Display1:
            return thinFont
        case .Headline:
            return normalFont
        case .Title:
            return mediumFont
        case .SubHeadline:
            return normalFont
        case .Body2, .Button:
            return mediumFont
        case .Body1, .Custom(_):
            return thinFont
        case .Caption:
            return normalFont
        }
    }
}

// Create a vendor...

/// Custom Vendor to return the theme specific to this app.
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

// ... and assign it as the default vendor early in the running stage
extension TKThemeVendor {
    
    override public class func initialize() {
        
        if self == TKThemeVendor.self {
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
