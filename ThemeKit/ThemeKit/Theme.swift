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



@IBDesignable
public class TestButton: UIButton {
    
    var colours = ["red": UIColor.redColor(), "green": UIColor.greenColor(), "purple": UIColor.purpleColor()]
    var fonts = ["bold":UIFont.boldSystemFontOfSize(16.0), "italic":UIFont.italicSystemFontOfSize(16.0)]
    
//    var baseFontSizes = [UIContentSizeCategoryExtraSmall: ]
//    var testStyleSizeAdjustment = []
    
    @IBInspectable var tintColourID:String?
    @IBInspectable var fontID:String?
    @IBInspectable var fontSizeID:String?
    @IBInspectable var textStyleId:String?
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        applyTheme()
    }
    
    func applyTheme() {
        fontDump()
        
        if let colourID = tintColourID,
            let colour = colours[colourID] {
                self.tintColor = colour
        }
        
//        if let fontID = self.fontID,
//            let font = fonts[fontID] {
//                titleLabel?.font = font
//        }
        
        if let textStyleId = self.textStyleId,
            let textStyle = TextStyle(rawValue: textStyleId) {
            
                let theme = MaterialTheme()
                titleLabel?.font = theme.font(textStyle)
        }
    }
    
    public override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        applyTheme()
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