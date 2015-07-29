//
//  ThemeableText.swift
//  ThemeKit
//
//  Created by Josh Campion on 22/07/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

protocol ImplicitTextable : class {
    var font:UIFont! { get set }
    var textColor:UIColor! { get set }
}

protocol Textable {

    var font:UIFont? { get set }
    var textColor:UIColor? { get set }
    
}

protocol ThemeableText {
    
    var textStyle:TextStyle? { get set }
    var textStyleId:String? { get set }
    
    var textColourStyle:ColourStyle? { get set }
    var textColourStyleId:String? { get set }
    
    func applyTextTheme()
}

// require self to be AnyObject as requiring mutating currently causes a compilation crash
extension ThemeableText where Self:Textable, Self:AnyObject {
    
    func applyTextTheme() {
        let theme = MaterialTheme()
        if let textStyle = self.textStyle {
            font = theme.font(textStyle)
        }
        
        if let colourStyle = self.textColourStyle {
            textColor = theme.colour(colourStyle)
        }
    }
}

// require self to be AnyObject as requiring mutating currently causes a compilation crash
extension ThemeableText where Self:ImplicitTextable, Self: AnyObject {
    
    func applyTextTheme() {
        let theme = MaterialTheme()
        if let textStyle = self.textStyle {
            font = theme.font(textStyle)
        }
        
        if let colourStyle = self.textColourStyle {
            textColor = theme.colour(colourStyle)
        }
    }
}

extension UILabel: ImplicitTextable { }
extension UITextField: Textable { }
extension UITextView: Textable { }

extension UIView {
    
    func iterateSubviews(condition: (UIView, inout stop:Bool) -> ()) {
        
        var shouldStop = false
        
        condition(self, stop:&shouldStop)
        
        if shouldStop { return }
        
        for sv in subviews {
            condition(sv, stop:&shouldStop)
            
            if shouldStop { break }
        }
    }
}

extension UISearchBar {

    func containedTextField() -> UITextField? {
        
        var textField:UITextField?
        iterateSubviews { (view:UIView, inout stop:Bool) -> () in
            if let tf = view as? UITextField {
                textField = tf
                stop = true
            }
        }
        
        return textField
    }
}

@IBDesignable
public class TKLabel: UILabel, ThemeableText {
    
    var textStyle:TextStyle?
    var textColourStyle:ColourStyle?
    
    @IBInspectable var textStyleId:String? {
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
    
    @IBInspectable var textColourStyleId:String? {
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

@IBDesignable
public class TKTextField: UITextField, ThemeableText {
    
    var textStyle:TextStyle?
    var textColourStyle:ColourStyle?
    
    @IBInspectable var textStyleId:String? {
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
    
    @IBInspectable var textColourStyleId:String? {
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

@IBDesignable
public class TKTextView: UITextView, ThemeableText {
    
    var textStyle:TextStyle?
    var textColourStyle:ColourStyle?
    
    @IBInspectable var textStyleId:String? {
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
    
    @IBInspectable var textColourStyleId:String? {
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