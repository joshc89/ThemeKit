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

let ThemeKitLicense =  "AEsLR3FVdiRa5qHzrD1sEXXHvrQ=" // "Simulator"

struct MyTheme: Theme {
    
    let thinSFFont = ".SFUIText-Light"
    let normalSFFont = ".SFUIText-Regular"
    let mediumSFFont = ".SFUIText-Semibold"
    
    let thinHFont = "HelveticaNeue-Light"
    let normalHFont = "HelveticaNeue"
    let mediumHFont = "HelveticaNeue-Medium"
    
    let defaultTextSizes = MaterialTextSizes // default
    let textSizeAdjustments = AppleFontAdjustments // default
    
    let themeColours:[ColourStyle:UIColor] = [.Accent: UIColor.yellowColor(),
                                              .Main: UIColor.redColor(),
                                              .Text: UIColor.blackColor().colorWithAlphaComponent(0.87),
                                              .SecondaryText: UIColor.blackColor().colorWithAlphaComponent(0.54),
                                              .LightText: UIColor.whiteColor().colorWithAlphaComponent(0.87),
                                              .SecondaryLightText: UIColor.whiteColor().colorWithAlphaComponent(0.54),
                                              ]
    
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
            ThemeKit.setLicenseKey(ThemeKitLicense)
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
