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
    
    //    typealias ThemeType = MaterialTheme
    
    //    var theme = MaterialTheme()
    
    // MARK: - Properties
    
    // MARK: IB Properties
    @IBInspectable var onTintColourId:String? {
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
    
    @IBInspectable var thumbTintColourId:String? {
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
    var onTintColourStyle:ColourStyle?
    var thumbTintColourStyle:ColourStyle?
    
    func applyTheme<T : Theme>(theme: T) {
        if let style = onTintColourStyle
            where style == .Accent {
                onTintColor = UIColor.redColor()
        }
        
        if let style = thumbTintColourStyle
            where style == .Accent {
                thumbTintColor = UIColor.blackColor()
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