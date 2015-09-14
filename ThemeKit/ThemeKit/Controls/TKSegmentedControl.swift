//
//  TKSegmentedControl.swift
//  ThemeKit
//
//  Created by Josh Campion on 12/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

@IBDesignable
public class TKSegmentedControl: UISegmentedControl, Themeable {

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
    
    public var tintColourStyle:ColourStyle?  {
        didSet {
            if oldValue != tintColourStyle {
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
    
    @IBInspectable public var tintColourId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue:idString) {
                    tintColourStyle = style
            }
        }
        get {
            return tintColourStyle?.rawValue
        }
    }
    
    public func applyTheme(theme:Theme) {
        
        if let colour = tintColourStyle {
            tintColor = theme.colour(colour)
        }
        
        if let text = textStyle {
            setTitleTextAttributes([NSFontAttributeName: theme.font(text)], forState: .Normal)
        }
    }
    
    public override func intrinsicContentSize() -> CGSize {
        let superSize = super.intrinsicContentSize()
        
        if let theme = theme(),
            let textStyle = self.textStyle {
                let font = theme.font(textStyle)
                
                let test:NSString = "Testing"
                let boundingRect = test.boundingRectWithSize(CGSizeMake(CGFloat.max, CGFloat.max),
                    options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                    attributes: [NSFontAttributeName: font],
                    context: nil)
                
                return CGSizeMake(superSize.width, ceil(boundingRect.height) + 2.0 * 7.0)
        }
        
        return superSize
    }
}

