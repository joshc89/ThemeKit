//
//  TextThemeable.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public protocol ImplicitTextable: class {
    
    var font:UIFont! { get set }
    
    var textColor:UIColor! { get set }
}

public protocol Textable: class {
    
    var font:UIFont? { get set }
    
    var textColor:UIColor? { get set }
}

extension UILabel: ImplicitTextable { }
extension UITextField: Textable { }
extension UITextView: Textable { }

public protocol TextThemeable: Themeable {
    
    var textStyle:TextStyle? { get set }
    
    var textStyleId:String? { get set }
    
    var textColourStyle:ColourStyle? { get set }
    
    var textColourStyleId:String?  { get set }
    
    func applyTextTheme(theme:Theme)

}

public extension TextThemeable where Self:Textable {
    
    func applyTextTheme(theme:Theme) {
        
        if let style = textStyle {
            font = theme.font(style)
        }
    
        if let style = textColourStyle {
            textColor = theme.colour(style)
        }
    }
}

public extension TextThemeable where Self:ImplicitTextable {
    
    func applyTextTheme(theme:Theme) {
        
        if let style = textStyle {
            font = theme.font(style)
        }
    
        if let style = textColourStyle {
            textColor = theme.colour(style)
        }
    }
}