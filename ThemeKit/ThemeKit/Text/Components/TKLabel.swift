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
    
    private let checker = _Checker()
    
    // - initWithFrame(_:) support
    public var createdFromNib:Bool = false
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        createdFromNib = true
    }
    
     public override func didMoveToSuperview() {
            super.didMoveToSuperview()
        
        if let theme = theme() where !createdFromNib {
            applyTheme(theme)
        }
    }
    
    // -- setNeedsUpdateTheme() support
    private var _needsUpdateTheme = true
    
    public func setNeedsUpdateTheme() {
        _needsUpdateTheme = true
        setNeedsLayout()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if _needsUpdateTheme {
            if let t = self.theme() {
                self.applyTheme(t)
            }
            _needsUpdateTheme = false
        }
    }
    
    // --
    
    public var textStyle:TextStyle?  {
        didSet {
            if oldValue != textStyle {
                setNeedsUpdateTheme()
            }
        }
    }
    
    public var textColourStyle:ColourStyle?  {
        didSet {
            if oldValue != textColourStyle {
                setNeedsUpdateTheme()
            }
        }
    }
    
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
}