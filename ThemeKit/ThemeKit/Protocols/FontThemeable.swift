//
//  FontThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public protocol ImplicitTextable: class {
    var font:UIFont! { get set }
}

public protocol Textable: class {
    var font:UIFont? { get set }
}

extension UILabel: ImplicitTextable { }
extension UITextField: Textable { }
extension UITextView: Textable { }

public protocol FontThemeable: Themeable {
    
    var textStyle:TextStyle? { get set }
    
    func applyFontTheme(theme:Theme)
}

public extension FontThemeable where Self:Textable {
    
    func applyFontTheme(theme:Theme) {
        if let style = textStyle {
            font = theme.font(style)
        }
    }
}

public extension FontThemeable where Self:ImplicitTextable {
    
    func applyFontTheme(theme:Theme) {
        if let style = textStyle {
            font = theme.font(style)
        }
    }
    
}

public protocol FontInspectable: FontThemeable {
    
    var textStyleId:String? { get set }
    
}