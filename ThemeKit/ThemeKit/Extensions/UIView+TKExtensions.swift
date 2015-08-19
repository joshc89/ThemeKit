//
//  UIView+TKExtensions.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import Foundation

extension UIView {
    
    func iterateSubviews(condition: (UIView, inout stop:Bool) -> ()) {
        
        var shouldStop = false
        
        condition(self, stop:&shouldStop)
        
        if shouldStop { return }
        
        for sv in subviews {
            condition(sv, stop:&shouldStop)
            
            if shouldStop { break }
        }
    }
}

/// Extending UIView to apply the theme at the default times: awakeFromNib(), prepareForInterfaceBuilder(). The default implementations of these methods are empty so it is safe to override them.
public extension UIView {
    
    
    // move to will move to window.
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if let themeable = self as? Themeable,
            let theme = themeable.theme() {
            themeable.applyTheme(theme)
        }
    }

    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        if let themeable = self as? Themeable,
            let theme = themeable.theme() {
                themeable.applyTheme(theme)
        }
    }
}