//
//  TextColourThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public protocol ImplicitTextColourable: class {
    var textColor:UIColor! { get set }
}

public protocol TextColourable: class {
    var textColor:UIColor? { get set }
}

extension UILabel: ImplicitTextColourable { }
extension UITextField: TextColourable { }
extension UITextView: TextColourable { }

public protocol TextColourThemeable: Themeable {
    
    var textColourStyle:ColourStyle? { get set }
    
    func applyTextColourTheme(theme: Theme)
}

public extension TextColourThemeable where Self:TextColourable {
    
    func applyTextColourTheme(theme: Theme) {
        if let style = textColourStyle {
            textColor = theme.colour(style)
        }
    }
}

public extension TextColourThemeable where Self:ImplicitTextColourable {
    
    func applyTextColourTheme(theme: Theme) {
        if let style = textColourStyle {
            textColor = theme.colour(style)
        }
    }
}

public protocol TextColourInspectable: TextColourThemeable {
    
    var textColourStyleId:String? { get set }
    
}