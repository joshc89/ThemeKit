//
//  ColourStyle.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

// Private String for the RawRepresentable value of `ColourStyle`s.

private let AccentLightRaw = "AccentLight"
private let AccentRaw = "Accent"
private let AccentDarkRaw = "AccentDark"

private let MainLightRaw = "MainLight"
private let MainRaw = "Main"
private let MainDarkRaw = "MainDark"

private let TextRaw = "Text"
private let SecondaryTextRaw = "SecondaryText"

private let LightTextRaw = "LightText"
private let SecondaryLightTextRaw = "SecondaryLightText"

/**
 
 Enum defining the available colour types. An app is liekly to use most of these cases and often define other highlight colours.
 
 The goal of `ColourStyle is to ensure colours provided by a designer are used consistently throughout an app, and can easily be changed. Repeatedly selecting the same specific Hex colour throughout a Storyboard is combersome and error prone. Each `TK*` subclass has all of its colourable properties exposed as a `ColourStyle` property allowing their colour to be set with a single identifier - this is simpler and safer.
 
 In the event of an app redesign, trialling new colours is simple and easy to revert. White labelled apps can each have a unique value for each `ColourStyle` but each view in an app can be reused without modification - even those in Storyboards.
 
 The enum cases are taken from the [Google Material Design guidelines for colour](https://www.google.com/design/spec/style/color.html#color-color-schemes). For more details on selecting a palette the documentation there is the recommended source.
 
 There may be times when this selection of colour styles is not appropriate or sufficient. In these situations the `.Custom(String)` case can be used to specify any `String` not matching one of the other enum cases. This custom `TextStyle` can be referenced from a Storyboard using the `String` value, and in code by defining a global variable:
 
        let myColourStyle = ColourStyle.Custom("MyOwnStyle")
 
 */
public enum ColourStyle: Hashable, RawRepresentable {
    
    public typealias RawValue = String
    
    case AccentLight, Accent, AccentDark
    case MainLight, Main, MainDark
    case Text, SecondaryText, LightText, SecondaryLightText
    case Custom(String)
    
    // MARK: Initialisers
    
    /**
     
     Default initialiser.
     
     - parameter rawValue: The string value matching a standard colour style. If `rawValue` does not match any of the standard values, `.Custom(rawValue)` is created instead.
     
     */
    public init?(rawValue: String) {
        
        switch rawValue {
        case AccentLightRaw:
            self = AccentLight
        case AccentRaw:
            self = Accent
        case AccentDarkRaw:
            self = AccentDark
        case MainLightRaw:
            self = MainLight
        case MainRaw:
            self = Main
        case MainDarkRaw:
            self = MainDark
        case TextRaw:
            self = Text
        case SecondaryTextRaw:
            self = SecondaryText
        case LightTextRaw:
            self = LightText
        case SecondaryLightTextRaw:
            self = SecondaryLightText
        default:
            self = .Custom(rawValue)
        }
    }
    
    // MARK: Protocol Conformance
    
    /**
     
     `RawRepresentable` protocol conformance.
     
     Returns a String value matching the enum name or the `String` value in `.Custom(String)`.
     
     */
    public var rawValue:String {
        switch self {
        case AccentLight:
            return AccentLightRaw
        case Accent:
            return AccentRaw
        case AccentDark:
            return AccentDarkRaw
        case MainLight:
            return MainLightRaw
        case Main:
            return MainRaw
        case MainDark:
            return MainDarkRaw
        case Text:
            return TextRaw
        case SecondaryText:
            return SecondaryTextRaw
        case LightText:
            return LightTextRaw
        case SecondaryLightText:
            return SecondaryLightTextRaw
        case .Custom(let str):
            return str
        }
    }

    /// `Hashable` protocol conformance. Returns the `hashValue` of the enum's `rawValue`.
    public var hashValue:Int {
        return rawValue.hashValue
    }
}

/// `ColourStyle: Equatable` conformance. Equality is determined by the equality of the `rawValue`.
public func ==(c1:ColourStyle, c2:ColourStyle) -> Bool {
    return c1.hashValue == c2.hashValue
}
