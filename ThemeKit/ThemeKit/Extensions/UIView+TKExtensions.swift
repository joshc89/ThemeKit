//
//  UIView+TKExtensions.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     
     Convenience function for iterating through each view in a hierarchy in a depth first manner. The iteration can be stopped part way through using the `inout` variable in the `condition` parameter.
     
     - parameter recursive: Flag for whether or not the search should be through the entire hierarchy or just this view's direct `subviews`. Default value is `true`.
     - parameter condition: Closure defining what should be performed on each view traversed in the hierarchy. The first parameter is the view in the hierarchy. The second parameter can be used to prevent any further iteration.
     
    */
    public func iterateSubviews(recursive:Bool = true, condition: (UIView, inout stop:Bool) -> ()) {
        
        var shouldStop = false
        
        condition(self, stop:&shouldStop)
        
        if shouldStop { return }
        
        for sv in subviews {
            
            if recursive {
                sv.iterateSubviews(condition: condition)
            } else {
                condition(sv, stop: &shouldStop)
            }
            
            if shouldStop { break }
        }
    }
}

/// Defines the function necessary to render a `TK*` view in a Storyboard.
public protocol IBThemeable {
    
    /// Should return the `Theme` used to style a view in a Storyboard.
    func ibTheme() -> Theme?
    
}

/// Extending UIView to apply the theme at the default times: `awakeFromNib()` and `prepareForInterfaceBuilder()`. The default implementations of these methods are empty so it is safe to override them in a protocol extension.
public extension UIView {
    
    // move to will move to window.
    /// Applies the `theme()` of this view if the view is `Themeable`.
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if let themeable = self as? Themeable,
            let theme = themeable.theme() {
            themeable.applyTheme(theme)
        }
    }

    /// Applies the `ibTheme()` of this view if the view is `IBThemeable`.
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        if let themeable = self as? Themeable,
            let ibThemeable = self as? IBThemeable,
            let thisTheme = ibThemeable.ibTheme() {
                themeable.applyTheme(thisTheme)
        }
    }
}