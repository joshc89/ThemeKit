//
//  TKSegmentedControl.swift
//  ThemeKit
//
//  Created by Josh Campion on 12/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

@IBDesignable
public class TKSegmentedControl: UISegmentedControl, BackgroundColourThemeable, TintColourThemeable, TextThemeable {
    
     
    
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        updateThemeIfNeeded()
    }
    
    // ensure the control fits a row of text in its themed font
    public override func intrinsicContentSize() -> CGSize {
        let superSize = super.intrinsicContentSize()
        
        if let font = titleTextAttributesForState(self.state)?[NSFontAttributeName] as? UIFont {
            
            let test:NSString = "Testing"
            let boundingRect = test.boundingRectWithSize(CGSizeMake(CGFloat.max, CGFloat.max),
                options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                attributes: [NSFontAttributeName: font],
                context: nil)
            
            return CGSizeMake(superSize.width, ceil(boundingRect.height) + 2.0 * 7.0)
        }
        
        return superSize
    }
    
    // MARK: - Theme Properties
    
    public var backgroundColourStyle:ColourStyle? {
        didSet {
            checkAndUpdateColourStyle(oldValue, backgroundColourStyle)
        }
    }
    
    public var tintColourStyle:ColourStyle? {
        didSet {
            checkAndUpdateColourStyle(oldValue, tintColourStyle)
        }
    }
    
    public var textStyle:TextStyle?  {
        didSet {
            checkAndUpdateTextStyle(oldValue, textStyle)
        }
    }
    
    public var textColourStyle:ColourStyle? {
        didSet {
            checkAndUpdateColourStyle(oldValue, textColourStyle)
        }
    }
    
    // MARK: Inspectable Properties
    
    public var backgroundColourStyleId:String? {
        get {
            return backgroundColourStyle?.rawValue
        }
        set {
            if let rawValue = newValue,
                let style = ColourStyle(rawValue: rawValue) {
                backgroundColourStyle = style
            } else {
                backgroundColourStyle = nil
            }
        }
    }

    public var tintColourStyleId:String? {
        get {
            return tintColourStyle?.rawValue
        }
        set {
            if let rawValue = newValue,
                let style = ColourStyle(rawValue: rawValue) {
                tintColourStyle = style
            } else {
                tintColourStyle = nil
            }
        }
    }

    public var textStyleId:String? {
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
    
    public var textColourStyleId:String? {
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

