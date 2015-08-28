//
//  TKSwitch.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import Foundation

@IBDesignable
public class TKSwitch:UISwitch, Themeable {
    
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
    
    // --
    
    // MARK: - Properties
    
    // MARK: IB Properties
    @IBInspectable public var onTintColourId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue: idString) {
                    onTintColourStyle = style
            }
        }
        get {
            return onTintColourStyle?.rawValue
        }
    }
    
    @IBInspectable public var thumbTintColourId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue: idString) {
                    thumbTintColourStyle = style
            }
        }
        get {
            return thumbTintColourStyle?.rawValue
        }
    }
    
    // MARK: Theme Enums
    public var onTintColourStyle:ColourStyle?
    public var thumbTintColourStyle:ColourStyle?
    
    public func applyTheme(theme: Theme) {
        
        if let style = onTintColourStyle {
                onTintColor = theme.colour(style)
        }
        
        if let style = thumbTintColourStyle {
                thumbTintColor = theme.colour(style)
        }
        
    }
    
    /*
    // in order to remove this the protocol extension cannot fully define the protocol otherwise the methods are statically dispatched not dynamically dispatched. See (http://nomothetis.svbtle.com/the-ghost-of-swift-bugs-future) for more details
    public override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    
    applyTheme()
    }
    
    public override func awakeFromNib() {
    super.awakeFromNib()
    
    applyTheme()
    }
    */
}