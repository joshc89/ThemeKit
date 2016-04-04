//
//  ThemeFunctions.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

/// Prints the font name for each family of fonts installed in the app. This is useful for debugging fonts appearing incorrectly.
public func fontDump() {
    
    var fontsString:String = ""
    
    for familyName in UIFont.familyNames() {
        fontsString += familyName + ":\n"
        for fontName in UIFont.fontNamesForFamilyName(familyName) {
            fontsString += "  " + fontName + "\n"
        }
        
        print(fontsString)
    }
}


/// Method to consistently print errors to the console.
internal func TKLogError(from:Any, function:String, message:String) {
    
    print("WARNING: [\(from.dynamicType), \(function)]: \(message)")
}