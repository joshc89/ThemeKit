//
//  TintColourThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public protocol TintColourThemeable: Themeable {
    
    var tintColourStyle:ColourStyle? { get set }
    
    var tintColourStyleId:String? { get set }
    
    func applyTintTheme(theme:Theme)
}

public extension TintColourThemeable where Self:UIView {
    
    public func applyTintTheme(theme: Theme) {
        if let tintStyle = tintColourStyle {
            tintColor = theme.colour(tintStyle)
        }
    }
}

