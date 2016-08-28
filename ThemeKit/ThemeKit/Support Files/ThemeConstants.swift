//
//  ThemeConstants.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

// MARK: - Constants

/**
 
 Apple's default system font sizes for comparison to `MaterialTextSizes`.
 
      UIFontTextStyleBody:          17.0
      UIFontTextStyleHeadline:      17.0
      UIFontTextStyleSubheadline:   15.0
      UIFontTextStyleCaption1:      12.0
      UIFontTextStyleCaption2:      11.0
      UIFontTextStyleFootnote:      13.0
 
 */
let AppleFontSizes:[String:CGFloat] = [UIFontTextStyleBody: 17.0,
    UIFontTextStyleHeadline: 17.0,
    UIFontTextStyleSubheadline: 15.0,
    UIFontTextStyleCaption1: 12.0,
    UIFontTextStyleCaption2: 11.0,
    UIFontTextStyleFootnote: 13.0
]

/**
 
 The default text sizes for each text style as defined by [Google Material Design Guidelines](https://www.google.com/design/spec/style/typography.html#typography-styles).
 
 
      .Display4:    112.0
      .Display3:    56.0
      .Display2:    45.0
      .Display1:    34.0
      .Headline:    24.0
      .Title:       20.0
      .SubHeadline: 16.0
      .Body2:       14.0
      .Body1:       14.0
      .Caption:     12.0
      .Button:      14.0
 
 */
public let MaterialTextSizes:[TextStyle:CGFloat] = [
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

/**
 
 The default font adjustments for each `UIContentSizeCategory` based on the changes in font size for Apple's system font.
 
        .ExtraSmall:            -3
        .Small:                 -2
        .Medium:                -1
        .Large:                  0
        .ExtraLarge:             1
        .ExtraExtraLarge:        2
        .ExtraExtraExtraLarge:   3
 
 */
public let AppleFontAdjustments:[UIContentSizeCategory:CGFloat] = [
    .ExtraSmall: -3,
    .Small: -2,
    .Medium: -1,
    .Large: 0,
    .ExtraLarge: 1,
    .ExtraExtraLarge: 2,
    .ExtraExtraExtraLarge: 3,
]

/// Enum to define content sizes for accessibility. This allows for exhaustive switch statements over using standard UIKit Strings. Accessibility Sizes are mapped to .ExtraExtraExtraLarge.
public enum UIContentSizeCategory:String {
    
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
