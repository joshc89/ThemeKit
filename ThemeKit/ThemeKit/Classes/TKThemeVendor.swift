//
//  TKWindow.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

public class TKThemeVendor: NSSingleton, Checking {
    
    let checker = _Checker()
    
    public var defaultTheme:Theme?
}