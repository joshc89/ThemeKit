//
//  TKLabel.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import Foundation

extension UILabel: ImplicitTextable { }

@IBDesignable
public class TKLabel: UILabel, ThemeableText {
    
    public var textStyle:TextStyle?
    public var textColourStyle:ColourStyle?
    
    @IBInspectable public var textStyleId:String? {
        set {
            if let idString = newValue,
                let style = TextStyle(rawValue:idString) {
                    textStyle = style
            }
        }
        get {
            return textStyle?.rawValue
        }
    }
    
    @IBInspectable public var textColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue:idString) {
                    textColourStyle = style
            }
        }
        get {
            return textColourStyle?.rawValue
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        print(__FUNCTION__)
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        print(__FUNCTION__)
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        
        
    }
    
    public override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        print(__FUNCTION__)
    }
}