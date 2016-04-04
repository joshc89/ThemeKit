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

public extension FontThemeable where Self: StateTitleTextAttributes {
    
    public func applyFontTheme(theme: Theme) {
        
        // theme the state dependent title text attributes
        var attributes = self.titleTextAttributesForState(.Normal) ?? [String:AnyObject]()
        
        if let style = textStyle {
            attributes[NSFontAttributeName] = theme.font(style)
        }
        
        setTitleTextAttributes(attributes, forState: .Normal)
    }
    
}

public extension TextColourThemeable where Self: StateTitleTextAttributes {
    
    public func applyTextColourTheme(theme: Theme) {
        
        // theme the state dependent title text attributes
        var attributes = self.titleTextAttributesForState(.Normal) ?? [String:AnyObject]()
        
        if let style = textColourStyle {
            attributes[NSForegroundColorAttributeName] = theme.colour(style)
        }
        
        setTitleTextAttributes(attributes, forState: .Normal)
    }
    
}

public extension FontThemeable where Self: StateObjectTitleTextAttributes {
    
    public func applyFontTheme(theme: Theme) {
        
        // theme the state dependent title text attributes
        var attributes = self.titleTextAttributesForState(.Normal) ?? [String:AnyObject]()
        
        if let style = textStyle {
            attributes[NSFontAttributeName] = theme.font(style)
        }
        
        setTitleTextAttributes(attributes, forState: .Normal)
    }
    
}

public extension TextColourThemeable where Self: StateObjectTitleTextAttributes {
    
    public func applyTextColourTheme(theme: Theme) {
        
        // theme the state dependent title text attributes
        var attributes = self.titleTextAttributesForState(.Normal) ?? [String:AnyObject]()
        
        if let style = textColourStyle {
            attributes[NSForegroundColorAttributeName] = theme.colour(style)
        }
        
        setTitleTextAttributes(attributes, forState: .Normal)
    }
    
}