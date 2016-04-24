//
//  TitleTextThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

/// Defines a protocol for objects that set text attributes such as font and colour through an optoinal dictionary of type `[String: AnyObject]` for multiple `UIControlState`s. This includes `UITabBarItem` and `UIBarButtonItem`. This allows protocol extensions to add functionality to multiple UIKit classes.
public protocol StateTitleTextAttributes {

    /**
     
     Getter for the title attributes in a given `UIControlState`.
     
     - parameter state: The control state to get the title text attributes for.
     
     - returns: The attributes for the title in the given state.
    */
    func titleTextAttributesForState(state: UIControlState) -> [String : AnyObject]?
    
    /**
     
     Setter for the title attributes in a given `UIControlState`.
     
     - parameter attributes: The attributes for the title in the given state.
     - parameter state: The control state to set the title text attributes for.
     
     */
    func setTitleTextAttributes(attributes: [String : AnyObject]?, forState state: UIControlState)
    
}

/// Defines a protocol for objects that set text attributes such as font and colour through an optoinal dictionary of type `[NSObject: AnyObject]` for multiple `UIControlState`s. This includes `UISegmentedControl`. This allows protocol extensions to add functionality to multiple UIKit classes.
public protocol StateObjectTitleTextAttributes {
    
    /**
     
     Getter for the title attributes in a given `UIControlState`.
     
     - parameter state: The control state to get the title text attributes for.
     
     - returns: The attributes for the title in the given state.
     */
    func titleTextAttributesForState(state: UIControlState) -> [NSObject : AnyObject]?
    
    /**
     
     Setter for the title attributes in a given `UIControlState`.
     
     - parameter attributes: The attributes for the title in the given state.
     - parameter state: The control state to set the title text attributes for.
     
     */
    func setTitleTextAttributes(attributes: [NSObject : AnyObject]?, forState state: UIControlState)
    
}

/// Protocol conformance to allow protocol extensions to give conformane to ThemeKit protocols.
extension UISegmentedControl: StateObjectTitleTextAttributes { }

/// Protocol conformance to allow protocol extensions to give conformane to ThemeKit protocols.
extension UITabBarItem: StateTitleTextAttributes { }

/// Protocol conformance to allow protocol extensions to give conformane to ThemeKit protocols.
extension UIBarButtonItem: StateTitleTextAttributes { }

public extension TextThemeable where Self: StateTitleTextAttributes {
    
    /// Applies the font and text colour for `UIControlState.Normal` from the given theme using `setTitleTextAttributes(_:forState:)`
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
    
    /// Applies the font and text colour for `UIControlState.Normal` from the given theme using `setTitleTextAttributes(_:forState:)`
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