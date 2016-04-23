//
//  ThemeView.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit
import ThemeKitCore

// IBInspectable properties must be declared on classes that are compiled in the same project as the Storyboard they are to be used in.

@IBDesignable
public class ThemeView: TKView, IBThemeable {
    
    @IBInspectable override public var backgroundColourStyleId: String? { didSet { } }
    
    @IBInspectable override public var tintColourStyleId: String? { didSet { } }
}

@IBDesignable
public class ThemeImageView: TKImageView, IBThemeable {
    
    @IBInspectable override public var backgroundColourStyleId: String? { didSet { } }
    
    @IBInspectable override public var tintColourStyleId: String? { didSet { } }
}