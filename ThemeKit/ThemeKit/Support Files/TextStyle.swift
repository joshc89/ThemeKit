//
//  TextStyle.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

// Private String for the RawRepresentable value of `TextStyle`s.

private let Display4Raw = "Display4"
private let Display3Raw = "Display3"
private let Display2Raw = "Display2"
private let Display1Raw = "Display1"
private let HeadlineRaw = "Headline"
private let TitleRaw = "Title"
private let SubHeadlineRaw = "SubHeadline"
private let Body1Raw = "Body1"
private let Body2Raw = "Body2"
private let CaptionRaw = "Caption"
private let ButtonRaw = "Button"

/**
 
 Enum defining the available fonts types. An app may only use a subset of these.
 
 The goal of the `TextStyle` is to ensure fonts used throughout the application are consistent and appropriate for the context they are used in. All `UITableView` and `UICollectionView` cells will likely have the same font styles for titles and details even if they are representing different model objects.
 
 The `TextStyle` also allows different fonts to be trialled in the event of an app design refresh. White labelled apps can each have a unique `Theme` but each view in an app can be reused without modification - even those in Storyboards.
 
 The values are taken from the [Google Material Design guidelines for typography](https://www.google.com/design/spec/style/typography.html#typography-styles). For more details on which styles are appropriate in different situations the documentation there is the recommended source.
 
 There may be times when this selection of font styles is not appropriate or sufficient. In these situations the `.Custom(String)` enum `case` can be used to specify any `String` not matching one of the other enum cases. This custom `TextStyle` can be referenced from a Storyboard using the `String` value, and in code by defining a global variable:
 
 let myTextStyle = TextStyle.Custom("MyOwnStyle")
 
 */
public enum TextStyle: Hashable, RawRepresentable {
    
    /// The `RawRepresentable` type for `TextStyle`.
    public typealias RawValue = String
    
    /// Display Text Styles: Typically used for large titles, results, or main data labels. Size increase with number i.e.. `Display4` > `Display3`.
    case Display4, Display3, Display2, Display1
    
    /// Typically a large font used for page headings.
    case Headline
    
    /// Typically a medium sized font used for element titles such as `UITableViewCell` and `UICollectionViewCell` titles.
    case Title
    
    /// Typically a medium sized font used to distinguish sub-elements within a page `UITableView` and `UICollectionView` section headings.
    case SubHeadline
    
    /// Typically a readable sans serif font.
    case Body1
    
    /// Typically a bold or italic veriant of Body1 allowing for text highlights.
    case Body2
    
    /// Typically the smallest font, used for `UITabBarItems` and small, ancillary text.
    case Caption
    
    /// Typically a font that is similar to `Body1` and `Body2` that is clearly a call to action to help ensure the button stands out as interactable.
    case Button
    
    /// A unique style defined by the programmer in circumstances where the default [Google Material Design](https://www.google.com/design/spec/style/typography.html#typography-styles) selection is insufficient.
    case Custom(String)
    
    /**
     
     Default initialiser.
     
     - parameter rawValue: The string value matching a standard text style. If `rawValue` does not match any of the standard values, `.Custom(rawValue)` is created instead.
     
     */
    public init?(rawValue: String) {
        switch rawValue{
        case Display4Raw:
            self = Display4
        case Display3Raw:
            self = Display3
        case Display2Raw:
            self = Display2
        case Display1Raw:
            self = Display1
        case HeadlineRaw:
            self = Headline
        case TitleRaw:
            self = Title
        case SubHeadlineRaw:
            self = SubHeadline
        case Body1Raw:
            self = Body1
        case Body2Raw:
            self = Body2
        case CaptionRaw:
            self = Caption
        case ButtonRaw:
            self = Button
        default:
            self = .Custom(rawValue)
        }
    }
    
    /**
     
     `RawRepresentable` protocol conformance.
     
     Returns a String value matching the enum name or the `String` value in `.Custom(String)`.
     
     */
    public var rawValue:String {
        switch self {
        case Display4:
            return Display4Raw
        case Display3:
            return Display3Raw
        case Display2:
            return Display2Raw
        case Display1:
            return Display1Raw
        case Headline:
            return HeadlineRaw
        case Title:
            return TitleRaw
        case SubHeadline:
            return SubHeadlineRaw
        case Body1:
            return Body1Raw
        case Body2:
            return Body2Raw
        case Caption:
            return CaptionRaw
        case Button:
            return ButtonRaw
        case Custom(let str):
            return str
        }
    }
    
    /// `Hashable` protocol conformance. Returns the `hashValue` of the enum's `rawValue`.
    public var hashValue: Int {
        return rawValue.hashValue
    }
}

/// Equatable conformance. Equality is determined by the equality of the `rawValue`. 
public func ==(t1:TextStyle, t2:TextStyle) -> Bool {
    return t1.hashValue == t2.hashValue
}