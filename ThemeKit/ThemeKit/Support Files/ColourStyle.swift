//
//  ColourStyle.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

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

/// Enum defining the available colour types.
public enum ColourStyle: Hashable, RawRepresentable {
    
    public typealias RawValue = String
    
    case AccentLight, Accent, AccentDark
    case MainLight, Main, MainDark
    case Text, SecondaryText, LightText, SecondaryLightText
    case Custom(String)
    
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

    public var hashValue:Int {
        return rawValue.hashValue
    }
}

public func ==(c1:ColourStyle, c2:ColourStyle) -> Bool {
    return c1.hashValue == c2.hashValue
}
