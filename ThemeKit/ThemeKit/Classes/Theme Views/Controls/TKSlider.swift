//
//  TKSlider.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public class TKSlider: UISlider, ThumbTintColourThemeable, Checking {
    
    // let checker = _Checker()
    
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        updateThemeIfNeeded()
    }
    
    // MARK: - Theme Properties
    
    public var thumbTintColourStyle:ColourStyle? {
        didSet {
            checkAndUpdateColourStyle(oldValue, thumbTintColourStyle)
        }
    }
    
    // MARK: Custom Theme Properties
    
    public var minimumTrackTintColourStyle:ColourStyle? {
        didSet {
            checkAndUpdateColourStyle(oldValue, minimumTrackTintColourStyle)
        }
    }
    
    public var maximumTrackTintColourStyle:ColourStyle? {
        didSet {
            checkAndUpdateColourStyle(oldValue, minimumTrackTintColourStyle)
        }
    }
    
    // MARK: Inspectable Properties
    
    public var thumbTintColourStyleId:String? {
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
    
    public var minimumTrackTintColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue: idString) {
                minimumTrackTintColourStyle = style
            }
        }
        get {
            return minimumTrackTintColourStyle?.rawValue
        }
    }
    
    public var maximumTrackTintColourStyleId:String? {
        set {
            if let idString = newValue,
                let style = ColourStyle(rawValue: idString) {
                maximumTrackTintColourStyle = style
            }
        }
        get {
            return maximumTrackTintColourStyle?.rawValue
        }
    }

    
    // MARK: Custom Apply Theme
    
    public func applyTheme(theme: Theme) {
        
        applyProtocolThemes(theme)
        
        if let style = minimumTrackTintColourStyle {
            minimumTrackTintColor = theme.colour(style)
        }
        
        if let style = maximumTrackTintColourStyle {
            maximumTrackTintColor = theme.colour(style)
        }
    }
}