//
//  AppDelegate.swift
//  ThemeDemo
//
//  Created by Josh Campion on 06/07/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit
import ThemeKit

@IBDesignable
class ThemeView: TKView { }

// --- Text Elements --- \\

@IBDesignable
class ThemeLabel: TKLabel { }

@IBDesignable
class ThemeTextField: TKTextField { }

@IBDesignable
class ThemeTextView: TKTextView { }

// --- Controls --- \\

@IBDesignable
class ThemeButton: TKButton { }

@IBDesignable
class ThemeSwitch: TKSwitch { }

@IBDesignable
class ThemeSegmentedControl: TKSegmentedControl { }

@IBDesignable
class ThemeStepper: TKStepper { }

// --- Navigation --- \\

@IBDesignable
class ThemeNavigationBar { }

@IBDesignable
class ThemeBarButtonItem { }

//@IBDesignable
//class ThemeTabBarItem { }
//
//@IBDesignable
//class ThemeTabBar { } 

class MaterialVendor: TKThemeVendor {
    
    private let _defaultTheme = MaterialTheme()
    
    override func defaultTheme() -> Theme? {
        return _defaultTheme
    }
}

extension TKThemeVendor {
    override public class func initialize() {
        _internalSharedVendor = MaterialVendor()
    }
}

struct MaterialTheme: Theme {
    
    typealias TextStyleType = TextStyle // default
    typealias ColourStyleType = ColourStyle // default
    
    let defaultTextSizes = MaterialTextSizes // default
    let textSizeAdjustments = AppleFontAdjustments // default
    
    let themeColours = MaterialColours
    
    func fontName(textStye:TextStyle) -> String {
        
        switch textStye {
        case .Display4:
            return "HelveticaNeue-Light"
        case .Display3, .Display2, .Display1, .Headline, .SubHeadline, .Body1, .Caption:
            return "HelveticaNeue"
        case .Title, .Body2, .Button:
            return "HelveticaNeue-Medium"
        }
    }
}

let MaterialColours:[ColourStyle:UIColor] = [
    .Accent: UIColor.redColor(),
    .Main: UIColor.greenColor(),
    .Text: UIColor.blackColor().colorWithAlphaComponent(0.87),
    .SecondaryText: UIColor.blackColor().colorWithAlphaComponent(0.54),
    .LightText: UIColor.whiteColor().colorWithAlphaComponent(0.87),
    .SecondaryLightText: UIColor.whiteColor().colorWithAlphaComponent(0.54)
]

/*
class MaterialThemedWindow:TKWindow {
    
    override class func themeType() -> Theme.Type {
        return MaterialTheme.self
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
*/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    override init() {
        
        
//        window = MaterialThemedWindow(frame: UIScreen.mainScreen().bounds)
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if let tabBarC = window?.rootViewController as? UITabBarController   {
            
            tabBarC.tabBar.tintColor = UIColor.greenColor()
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

