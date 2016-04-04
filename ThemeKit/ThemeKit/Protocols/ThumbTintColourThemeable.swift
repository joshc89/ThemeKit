//
//  ThumbTintColourThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public protocol ThumbTint:class {
    
    var thumbTintColor:UIColor? { get set }
    
}

extension UISlider: ThumbTint { }
extension UISwitch: ThumbTint { }

public protocol ThumbTintColourThemeable: Themeable {
    
    var thumbTintColourStyle:ColourStyle? { get set }
    
    func applyThumbTintTheme(theme:Theme)
    
}

public extension ThumbTintColourThemeable where Self: ThumbTint {
    
    public func applyThumbTintTheme(theme:Theme) {
        if let style = thumbTintColourStyle {
            thumbTintColor = theme.colour(style)
        }
    }
}

public protocol ThumbTintColourInspectable: ThumbTintColourThemeable {

    var thumbTintColourStyleId:String? { get set }
    
}