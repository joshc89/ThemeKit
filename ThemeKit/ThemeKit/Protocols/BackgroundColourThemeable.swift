//
//  BackgroundColourThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public protocol BackgroundColourThemeable: Themeable {
    
    var backgroundColourStyle:ColourStyle? { get set }
    
    func applyBackgroundTheme(theme:Theme)
}

public extension BackgroundColourThemeable where Self:UIView {
    
    public func applyBackgroundTheme(theme: Theme) {
        if let bgStyle = backgroundColourStyle {
            backgroundColor = theme.colour(bgStyle)
        }
    }
}

public protocol BackgroundColourInspectable: BackgroundColourThemeable {
    
    var backgroundColourStyleId:String? { get set }
    
}