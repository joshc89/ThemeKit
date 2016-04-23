//
//  TitleTextThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public protocol StateTitleTextAttributes {

    func titleTextAttributesForState(state: UIControlState) -> [String : AnyObject]?
    
    func setTitleTextAttributes(attributes: [String : AnyObject]?, forState state: UIControlState)
    
}

public protocol StateObjectTitleTextAttributes {
    
    func titleTextAttributesForState(state: UIControlState) -> [NSObject : AnyObject]?
    
    func setTitleTextAttributes(attributes: [NSObject : AnyObject]?, forState state: UIControlState)
    
}

extension UISegmentedControl: StateObjectTitleTextAttributes { }
extension UITabBarItem: StateTitleTextAttributes { }
extension UIBarButtonItem: StateTitleTextAttributes { }

public extension TextThemeable where Self: StateTitleTextAttributes {
    
    public func applyTextTheme(theme: Theme) {
        
        // theme the state dependent title text attributes
        var attributes = self.titleTextAttributesForState(.Normal) ?? [String:AnyObject]()
        
        if let style = textStyle {
            attributes[NSFontAttributeName] = theme.font(style)
        }
    
        if let style = textColourStyle {
            attributes[NSForegroundColorAttributeName] = theme.colour(style)
        }
        
        setTitleTextAttributes(attributes, forState: .Normal)
    }
    
}

public extension TextThemeable where Self: StateObjectTitleTextAttributes {
    
    public func applyTextTheme(theme: Theme) {
        
        // theme the state dependent title text attributes
        var attributes = self.titleTextAttributesForState(.Normal) ?? [String:AnyObject]()
        
        if let style = textStyle {
            attributes[NSFontAttributeName] = theme.font(style)
        }
        
        if let style = textColourStyle {
            attributes[NSForegroundColorAttributeName] = theme.colour(style)
        }
        
        setTitleTextAttributes(attributes, forState: .Normal)
    }
    
}