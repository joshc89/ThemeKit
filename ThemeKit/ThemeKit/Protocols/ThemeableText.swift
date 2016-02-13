//
//  ThemeableText.swift
//  ThemeKit
//
//  Created by Josh Campion on 22/07/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

/*
public protocol ThemeableTextColor: Themeable {
    
    var textStyle:TextStyle? { get set }
    var textStyleId:String? { get set }
    
    var textColourStyle:ColourStyle? { get set }
    var textColourStyleId:String? { get set }
}

public protocol ThemeableText: ThemeableFont, ThemeableTextColor {
    
    func applyTextTheme(theme:Theme)
}

// require self to be AnyObject as requiring mutating currently causes a compilation crash
public extension ThemeableText where Self:Textable {
    
    func applyDefaultTextTheme(theme:Theme) {
        if let textStyle = self.textStyle {
            font = theme.font(textStyle)
        }
        
        if let colourStyle = self.textColourStyle {
            textColor = theme.colour(colourStyle)
        }
    }
    
    public func applyTextTheme(theme:Theme) {
        applyDefaultTextTheme(theme)
    }
}

// require self to be AnyObject as requiring mutating currently causes a compilation crash
public extension ThemeableText where Self:ImplicitTextable {
    
    public func applyDefaultTextTheme(theme:Theme) {
        if let textStyle = self.textStyle {
            font = theme.font(textStyle)
        }
        
        if let colourStyle = self.textColourStyle {
            textColor = theme.colour(colourStyle)
        }
    }
    
    public func applyTextTheme(theme:Theme) {
        applyDefaultTextTheme(theme)
    }
}
*/
