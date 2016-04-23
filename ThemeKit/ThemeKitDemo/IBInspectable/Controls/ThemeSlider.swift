//
//  ThemeSlider.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit
import ThemeKitCore

@IBDesignable
public class ThemeSlider: TKSlider, IBThemeable {
    
    @IBInspectable override public var thumbTintColourStyleId:String? { didSet { }    }
    
    @IBInspectable override public var minimumTrackTintColourStyleId:String? { didSet { }    }
    
    @IBInspectable override public var maximumTrackTintColourStyleId:String? { didSet { }    }
}