//
//  ThemeTabBar.swift
//  ThemeKit
//
//  Created by Josh Campion on 07/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit
import ThemeKitCore

@IBDesignable
public class ThemeTabBar: TKTabBar, IBThemeable {
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var barTintColourStyleId:String? { didSet { } }
}
