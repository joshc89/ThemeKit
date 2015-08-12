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

    public var textStyle:TextStyle?
    public var tintColourStyle:ColourStyle?
    
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
    
    func applyTheme(theme:Theme) {
        
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

