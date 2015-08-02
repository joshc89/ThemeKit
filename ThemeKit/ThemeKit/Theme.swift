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
    case MainLight, Main, MainDark
    case Text, SecondaryText, LightText, SecondaryLightText
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

typealias RawRepresentableKey = protocol<RawRepresentable, Hashable>

let MaterialColours:[ColourStyle:UIColor] = [
    .Accent: UIColor.redColor(),
    .Main: UIColor.greenColor(),
    .Text: UIColor.blackColor().colorWithAlphaComponent(0.87),
    .SecondaryText: UIColor.blackColor().colorWithAlphaComponent(0.54),
    .LightText: UIColor.whiteColor().colorWithAlphaComponent(0.87),
    .SecondaryLightText: UIColor.whiteColor().colorWithAlphaComponent(0.54)
]

protocol Theme {
    
    typealias TextStyleType:RawRepresentableKey
    typealias ColourStyleType:RawRepresentableKey
    
    var defaultTextSizes:[TextStyleType:CGFloat] { get }
    var textSizeAdjustments:[UIContentSizeCategory:CGFloat] { get }
    
    var themeColours:[ColourStyleType:UIColor] { get }
    
    /**

    Returns the font name for a given text style, which is used in UIFont(name:size:).
    
    To ensure good consistent design, only a few font faces should be specified for a theme, and text styles should be variants of those font faces. Due to the number of text styles vs the number of font names, this can be more succinctly expressed as a switch than a dictionary.

    - seealso: MaterialTheme
    */
    func fontName(textStyle:TextStyleType) -> String
    
    
    func font(textStyle:TextStyleType) -> UIFont
}

extension Theme {
    
    func fontSize(textStyle:TextStyleType) -> CGFloat {
        
        var fontSize:CGFloat
        if let size = defaultTextSizes[textStyle] {
            fontSize = size
        } else {
            TKLogError(self, function: __FUNCTION__, message: "No text size specified for text style \(textStyle.rawValue). Using defualt 17.0.")
            fontSize = 17.0
        }
        
        if let contentSize = UIContentSizeCategory(contentSize: UIApplication.sharedApplication().preferredContentSizeCategory),
            let adjustment = textSizeAdjustments[contentSize] {
                fontSize += adjustment
        }
        
        return fontSize
    }
    
    
    func font(textStyle:TextStyleType) -> UIFont {
        
        let size = fontSize(textStyle)
        guard let font = UIFont(name: fontName(textStyle), size: size) else {
            TKLogError(self, function: __FUNCTION__, message: "No font specified for text style \(textStyle.rawValue). Using system font.")
            return UIFont.systemFontOfSize(size)
        }
        
        return font
    }
    
    func colour(colourStyle:ColourStyleType) -> UIColor {

        guard let colour = themeColours[colourStyle] else {
            TKLogError(self, function: __FUNCTION__, message: "No colour specified for colour style \(colourStyle.rawValue). Using default Black.")
            return UIColor.blackColor()
        }
        
        return colour
    }
}

/// Method to consistently print errors to the console.
internal func TKLogError(from:Any, function:String, message:String) {
    
    print("[\(from), \(function)]: \(message)")
}

struct MaterialTheme: Theme {
    
    typealias TextStyleType = TextStyle // default
    typealias ColourStyleType = ColourStyle // default
    
    let defaultTextSizes = MaterialTextSizes // default
    let textSizeAdjustments = AppleFontAdjustments // default
    
    let themeColours = MaterialColours
    
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
}

/// Enum to define content sizes for accessibility allowing for exhaustive switch statements. Accessibility Sizes are mapped to UIContentSizeCategoryExtraExtraLarge.
enum UIContentSizeCategory:String {
    
    case ExtraSmall, Small, Medium, Large, ExtraLarge, ExtraExtraLarge, ExtraExtraExtraLarge
    
    /// Convenience initialiser to create the enum from a UIContentSizeCategory String from UIKit. Fails if the sting is not one of those.
    init?(contentSize:String) {
        switch contentSize {
        case UIContentSizeCategoryExtraSmall:
            self = .ExtraSmall
        case UIContentSizeCategorySmall:
            self = .Small
        case UIContentSizeCategoryMedium:
            self = .Medium
        case UIContentSizeCategoryLarge:
            self = .Large
        case UIContentSizeCategoryExtraLarge:
            self = .ExtraLarge
        case UIContentSizeCategoryExtraExtraLarge:
            self = .ExtraExtraLarge
        case UIContentSizeCategoryExtraExtraExtraLarge,
        UIContentSizeCategoryAccessibilityMedium,
        UIContentSizeCategoryAccessibilityLarge,
        UIContentSizeCategoryAccessibilityExtraLarge,
        UIContentSizeCategoryAccessibilityExtraExtraLarge,
        UIContentSizeCategoryAccessibilityExtraExtraExtraLarge:
            self = .ExtraExtraExtraLarge
        default:
            return nil
        }
    }
}

let AppleFontAdjustments:[UIContentSizeCategory:CGFloat] = [
    .ExtraSmall: -3,
    .Small: -2,
    .Medium: -1,
    .Large: 0,
    .ExtraLarge: 1,
    .ExtraExtraLarge: 2,
    .ExtraExtraExtraLarge: 3,
]


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
    
//    func theme<ThemeType:Theme>() -> ThemeType
    
    func applyTheme<T:Theme>(theme:T)
}

extension Themeable {
    
    func applyTheme<T:Theme>(theme:T) {
        
        if let textSelf = self as? ThemeableText {
            textSelf.applyTextTheme(theme)
        }
    }
}

extension UIView {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        let mat = MaterialTheme()
        if let themeable = self as? Themeable {
            themeable.applyTheme(mat)
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        let mat = MaterialTheme()
        if let themeable = self as? Themeable {
            themeable.applyTheme(mat)
        }
    }
}

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

@IBDesignable
public class TKButton: UIButton {
    
    
    @IBInspectable var tintColourId:String?
    @IBInspectable var textStyleId:String?
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        let mat = MaterialTheme()
        applyTheme(mat)
    }
    
    func applyTheme<T:Theme where T.TextStyleType.RawValue == String>(theme:T) {
        fontDump()
        
        let theme = MaterialTheme()
        
        if let colourID = tintColourId,
            let style = ColourStyle(rawValue: colourID) {
                self.tintColor = theme.colour(style)
        }
        
        if let textStyleId = self.textStyleId,
            let textStyle = T.TextStyleType(rawValue: textStyleId) {
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