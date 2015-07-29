//
//  Theme.swift
//  ThemeKit
//
//  Created by Josh Campion on 06/07/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import Foundation
import ObjectiveC

public func fontDump() {
    for familyName in UIFont.familyNames() {
        for fontName in UIFont.fontNamesForFamilyName(familyName) {
            print("\(fontName)")
        }
    }
}

let AppleFontSizes = [UIFontTextStyleBody: 17,
    UIFontTextStyleHeadline: 17,
    UIFontTextStyleSubheadline: 15,
    UIFontTextStyleCaption1: 12,
    UIFontTextStyleCaption2: 11,
    UIFontTextStyleFootnote: 13]

enum ColourStyle:String {
    
    case AccentLight, Accent, AccentDark
    case Main, MainLight, MainDark
    case Text, SecondaryText
}

enum TextStyle:String {
    
    case Display4, Display3, Display2, Display1
    case Headline, Title, SubHeadline
    case Body1, Body2
    case Caption
    case Button
    
}

let MaterialTextSizes:[TextStyle:CGFloat] = [
    .Display4: 112.0,
    .Display3: 56.0,
    .Display2: 45.0,
    .Display1: 34.0,
    .Headline: 24.0,
    .Title: 20.0,
    .SubHeadline: 16.0,
    .Body2: 14.0,
    .Body1: 14.0,
    .Caption: 12.0,
    .Button: 14.0
]

let MaterialColours:[ColourStyle:UIColor] = [
    .Accent: UIColor.redColor(),
    .Main: UIColor.greenColor(),
    .Text: UIColor.blackColor().colorWithAlphaComponent(0.87),
    .SecondaryText: UIColor.blackColor().colorWithAlphaComponent(0.54)
]

struct MaterialTheme {
    
    func fontName(textStye:TextStyle) -> String {
        
        switch textStye {
        case .Display4:
            return "HelveticaNeue-Light"
        case .Display3, .Display2, .Display1, .Headline, .SubHeadline, .Body1, .Caption:
            return "HelveticaNeue"
        case .Title, .Body2, .Button:
            return "HelveticaNeue-Medium"
        }
    }
    
    func fontSize(textStyle:TextStyle) -> CGFloat {
        
        var fontSize:CGFloat
        if let size = MaterialTextSizes[textStyle] {
            fontSize = size
        } else {
            fontSize = 17.0
        }
        
        if let adjustment = AppleFontAdjustments[UIApplication.sharedApplication().preferredContentSizeCategory] {
            fontSize += adjustment
        }
        
        return fontSize
    }
    
    func font(textStyle:TextStyle) -> UIFont {
        return UIFont(name: fontName(textStyle), size: fontSize(textStyle))!
    }
    
    func colour(colourStyle:ColourStyle) -> UIColor? {
        return MaterialColours[colourStyle]
    }
}

let AppleFontAdjustments:[String:CGFloat] = [
    UIContentSizeCategoryExtraSmall: -3,
    UIContentSizeCategorySmall: -2,
    UIContentSizeCategoryMedium: -1,
    UIContentSizeCategoryLarge: 0,
    UIContentSizeCategoryExtraLarge: 1,
    UIContentSizeCategoryExtraExtraLarge: 2,
    UIContentSizeCategoryExtraExtraExtraLarge: 3,
]

enum ColourType: String {
    
    case Primary = "Primary"
    case Accent = "Accent"
    
}


struct TKTheme {
    
    let colours:[ColourType:UIColor]
    let fonts:[TextStyle:UIFont]
    
}

/*
protocol Themeable {
    
//    var theme:TKTheme { get set }
    func theme() -> TKTheme?
    var colourType:ColourType? { get set }
    
}

protocol ThemeableText: Themeable {

    var textColourType:ColourType { get set }
    var fontType:TextStyle { get set }
    
}

// themes for each state, which inheret from the Normal state
protocol ThemeableControl {
    
}

private var TKColourTypeKey = "TKColourType"
private var TKFontTypeKey = "TKFontType"

extension Themeable where Self: UIView {
    

}
*/

/*
extension UIView: Themeable {
    
    func theme() -> TKTheme? {
        print("getting theme: \(self)")
        return superview?.theme()
    }
    
    var fontType:FontType? {
        get {
            if let storedValue = objc_getAssociatedObject(self, &TKFontTypeKey) as? String,
                type = FontType(rawValue:storedValue) {
                    return type
            } else {
                return nil
            }
        }
        set {
            objc_setAssociatedObject(self, &TKColourTypeKey, newValue?.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var colourType:ColourType? {
        get {
            if let storedValue = objc_getAssociatedObject(self, &TKColourTypeKey) as? String,
                type = ColourType(rawValue:storedValue) {
                    let size:CGFloat = 12
                    UIFont.systemFontOfSize(size)
                    return type
            } else {
                return nil
            }
        }
        set {
            objc_setAssociatedObject(self, &TKColourTypeKey, newValue?.rawValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    @IBInspectable var colourTypeIB:String? {
        get {
            return colourType?.rawValue
        }
        set {
            if let newTypeString = newValue {
                if let newType = ColourType(rawValue: newTypeString) {
                    self.colourType = newType
                } else {
                    print("Cannot set colour type from IBString \(newTypeString)")
                }
            }
        }
    }
    
}
*/

// -- Tester Classes --- \\

public class TestLabel: UILabel {
    
    public override var tintColor:UIColor! {
        willSet {
            print("changing tint \(tintColor) -> \(newValue)")
        }
        didSet {
            print("changed tint \(oldValue) -> \(tintColor)")
        }
    }
    
    public override func tintColorDidChange() {
        super.tintColorDidChange()
    }
    
    public override var font:UIFont! {
        willSet {
            print("setting font \(newValue)")
        }
        didSet {
            print("set font \(font)")
        }
    }
    
}

protocol Themeable {
    func applyTheme()
}

extension Themeable {
    func applyTheme() {
        
        if let textSelf = self as? ThemeableText {
            textSelf.applyTextTheme()
        }
    }
}

extension UIView : Themeable {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        applyTheme()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        applyTheme()
    }
}

@IBDesignable
public class TKSwitch:UISwitch {
    
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
    
    func applyTheme() {
        if let style = onTintColourStyle
            where style == .Accent {
                onTintColor = UIColor.redColor()
        }
        
        if let style = thumbTintColourStyle
            where style == .Accent {
                thumbTintColor = UIColor.blackColor()
        }
        
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        applyTheme()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        applyTheme()
    }
}

@IBDesignable
public class TKButton: UIButton {
    
    @IBInspectable var tintColourId:String?
    @IBInspectable var textStyleId:String?
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        applyTheme()
    }
    
    func applyTheme() {
        fontDump()
        
        let theme = MaterialTheme()
        
        if let colourID = tintColourId,
            let style = ColourStyle(rawValue: colourID),
            let colour = theme.colour(style) {
                self.tintColor = colour
        }
        
        if let textStyleId = self.textStyleId,
            let textStyle = TextStyle(rawValue: textStyleId) {
                titleLabel?.font = theme.font(textStyle)
        }
    }
    
    public override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
     
        // TODO: Re-implement when using
//        applyTheme()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        applyTheme()
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    
    public override func willMoveToWindow(newWindow: UIWindow?) {
        super.willMoveToWindow(newWindow)
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
    }
    
    /*
    public override var tintColor:UIColor! {
        get {
            return UIColor.greenColor()
        }
        set {
            super.tintColor = newValue
        }
    }
    */
    
    public override func tintColorDidChange() {
        super.tintColorDidChange()
    }
    
    
}