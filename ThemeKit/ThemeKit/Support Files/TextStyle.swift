//
//  TextStyle.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

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

/// Enum defining the available fonts types. Typically an app will only use ~6 types.
public enum TextStyle: Hashable, RawRepresentable {

    public typealias RawValue = String
    
    case Display4, Display3, Display2, Display1
    case Headline, Title, SubHeadline
    case Body1, Body2
    case Caption
    case Button
    case Custom(String)
    
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
    
    public var hashValue: Int {
        return rawValue.hashValue
    }
}

public func ==(t1:TextStyle, t2:TextStyle) -> Bool {
    return t1.hashValue == t2.hashValue
}