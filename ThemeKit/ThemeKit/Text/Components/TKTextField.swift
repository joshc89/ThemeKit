//
//  TKTextField.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import Foundation

let TKDefaultInsets = UIEdgeInsetsMake(2.0, 7.0, 2.0, 7.0)

extension UITextField: Textable { }

@IBDesignable
public class TKTextField: UITextField, ThemeableText {
    
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
    
    public var textStyle:TextStyle?
    public var textColourStyle:ColourStyle?
    
    public override func layoutSubviews() {
        
        super.layoutSubviews()
        
        // TODO: This should be .Fill if there is no text and the placholderTextStyle != nil but .Center otherwise. There is still a bug when editting but no text is typed, so the placeholder is still visible
        /*
        if let text = self.text where !text.isEmpty {
            contentVerticalAlignment = .Center
        } else {
            contentVerticalAlignment = .Fill
        }
*/
    }
    
    private var _placeholderTextStyle:TextStyle?
    
    /// This can be set explicitly to configure the style of the placeholder text, otherwise it defaults to the textStyle property.
    public var placeholderTextStyle:TextStyle? {
        get {
            return _placeholderTextStyle ?? textStyle
        }
        set {
            _placeholderTextStyle = newValue
        }
    }
    
    public var placeholderTextColourStyle:ColourStyle?
    
    /// can set to nil to return to set textInsets to the default value but will always return a value
    @IBInspectable public var textInsetsString:String! {
        get {
            return "{\(textInsets.top),\(textInsets.left),\(textInsets.bottom),\(textInsets.right)}"
        } set {
            
            
            if var insetString = newValue {
                
                let c0 = insetString[insetString.startIndex]
                let c1 = insetString[advance(insetString.endIndex, -1)]
                
                if c0 == "{" && c1 == "}"  {
                    
                    let id1 = advance(insetString.startIndex, 1)
                    insetString = insetString.substringFromIndex(id1)
                    
                    let idPen = advance(insetString.endIndex, -1)
                    insetString = insetString.substringToIndex(idPen)
                    
                    let numbers = insetString.componentsSeparatedByString(",")
                    
                    var vals = [CGFloat]()
                    if numbers.count == 4 {
                        for numberString in numbers {
                            vals.append(CGFloat((numberString as NSString).floatValue))
                        }
                        
                        textInsets = UIEdgeInsetsMake(vals[0], vals[1], vals[2], vals[3])
                    }
                }
            } else {
                textInsets = TKDefaultInsets
            }
            
        }
    }
    
    override public func intrinsicContentSize() -> CGSize {
        
//        print("sizing: \(self)")
        
        let superSize = super.intrinsicContentSize()
//        print("super: \(superSize)")
        
        if let theme = theme(),
            myFont = font {
                // If font is not set, it is the default font so super.intrinsicContentSize() will be correct
                let text:NSString = self.text ?? "Testing Text"
                let textHeight = text.boundingRectWithSize(CGSizeMake(CGFloat.max, CGFloat.max),
                    options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                    attributes: [NSFontAttributeName: myFont],
                    context: nil).size.height
                var height = textHeight
                
//                print("\(text): \(textHeight)")
                
                let attributedPlaceholder:NSAttributedString?
                if let setPlaceholder = self.attributedPlaceholder {
                    attributedPlaceholder = setPlaceholder
                } else if let placeholderStyle = placeholderTextStyle {
                    attributedPlaceholder = NSAttributedString(string: "Testing Placeholder", attributes: [NSFontAttributeName: theme.font(placeholderStyle)])
                } else {
                    attributedPlaceholder = nil
                }
                
                if let attributed = attributedPlaceholder {
                    
                    // only consider the placeholder if there is an attributed placeholder, as this will be from the text style applied for the theme
                    let placeholderHeight = attributed.boundingRectWithSize(CGSizeMake(CGFloat.max, CGFloat.max),
                        options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                        context: nil).size.height
                    
//                    print("\(attributed.string): \(placeholderHeight)")
                    
                    height = max(placeholderHeight, height)
                }
                
//                print("insets: \(textInsetsString)")
                
                // ensure the insets are met
                height += textInsets.top + textInsets.bottom
                
//                print("height:\(height)")
                
                // don't let this become smaller than the default as other views won't fit correctly
                height = max(superSize.height, height)
                
                return CGSizeMake(superSize.width, height)
        }
        
        return superSize
    }
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        
        let superRect = super.textRectForBounds(bounds)
        
        let leftRect = leftViewRectForBounds(bounds)
        let rightRect = rightViewRectForBounds(bounds)
        
        var newBounds = bounds
        // inset the bounds based on the left and right views (this is for search bar support)
        newBounds.origin.x += leftRect.origin.x + leftRect.size.width
        newBounds.size.width -= leftRect.origin.x + leftRect.size.width + (CGRectGetMaxX(bounds) - rightRect.origin.x)
        
        // inset the bounds based on the text insets property.
        newBounds.origin.x += textInsets.left
        newBounds.origin.y += textInsets.top
        newBounds.size.width -= textInsets.left + textInsets.right
        newBounds.size.height -= textInsets.top + textInsets.bottom
        
//        print("\(text)/\(attributedPlaceholder): \(superRect) -> \(newBounds)")
        
        return newBounds
    }
    
    public override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
    
    override public func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        
        let superRect = super.placeholderRectForBounds(bounds)
        let textRect = textRectForBounds(bounds)
        
//        print("placeholder: \(superRect) -> \(textRect)")
        
        return superRect
    }
    
    
    public var textInsets:UIEdgeInsets = TKDefaultInsets
    
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
    
    @IBInspectable public var placeholderTextStyleId:String? {
        set {
            if let idString = newValue,
                let style = TextStyle(rawValue:idString) {
                    placeholderTextStyle = style
            }
        }
        get {
            return placeholderTextStyle?.rawValue
        }
    }
    
    @IBInspectable public var placeholderTextColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue:idString) {
                    placeholderTextColourStyle = style
            }
        }
        get {
            return placeholderTextColourStyle?.rawValue
        }
    }
    
    override public var placeholder: String? {
        didSet {
            if let theme = theme() {
                updatePlaceholder(theme)
            }
        }
    }

    public func applyTextTheme(theme: Theme) {
        
        applyDefaultTextTheme(theme)
        
        updatePlaceholder(theme)
    }
    
    func updatePlaceholder(theme:Theme) {
        if let attributedPlaceholder = self.attributedPlaceholder ?? (placeholder != nil ? NSAttributedString(string: placeholder!) : nil) {
            
            // confiure the placeholder
            
            var attributes = attributedPlaceholder.attributesAtIndex(0, effectiveRange: nil)
            
            if let placeholderStyle = self.placeholderTextStyle {
                attributes[NSFontAttributeName] = theme.font(placeholderStyle)
            }
            
            if let placeholderColourStyle = self.placeholderTextColourStyle {
                attributes[NSForegroundColorAttributeName] = theme.colour(placeholderColourStyle)
            }
            
            // Set new text with extracted attributes
            self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder.string, attributes: attributes)
        }
    }
}
