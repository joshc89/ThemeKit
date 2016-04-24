//
//  UIColor+TKExtensions.swift
//  ThemeKit
//
//  Created by Josh Campion on 13/02/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /**
     
     Convenience initialiser for creating a colour with `CGFloat` values in the 0-255 range not 0-1.0 range. This can be useful when working with designers who provide colours and 255 RGB values.
     
     - parameter with255Red: The R component of a 255 based RGB colour.
     - parameter green: The G component of a 255 based RGB colour.
     - parameter blue: The B component of a 255 based RGB colour.
     - parameter alpha: 0 - 1.0 value for the opacity of this colour. Default value is 1.0.
    */
    public convenience init(with255Red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat = 1.0) {
        self.init(red: with255Red / 255.0,
            green: green / 255.0,
            blue: blue / 255.0,
            alpha:alpha);
    }
    
    /**
     
     Convenience initialiser for create a colour with a hex string. The string can optionally begin with a `#`. The string can optionally contain an alpha value as the first 2 characters. If the string is in the incorrect format this initialiser fails.
     
     - parameter hexString: The string representing this colour.
     - parameter alpha: The alpha component for this colour if none is specified in `hexString`.
     
    */
    public convenience init?(hexString hex:String, alpha a:CGFloat = 1.0) {
        
        var hexString = hex
        var alpha = a
        
        if ((hexString.characters.count == 8 || hexString.characters.count == 6) && hexString.characters.first != "#") {
            hexString = "#\(hexString)"
        }
        
        if (hexString.characters.first != "#") {
            print("Hex color requires a '#' as the first character.")
            return nil
        }
        
        if (hexString.characters.count == 9) {
            let alphaRange = hexString.startIndex.advancedBy(1)...hexString.startIndex.advancedBy(2)
            
            let opacityString = hexString.substringWithRange(alphaRange)
            
            var alphaInt:UInt32 = 0
            let rScanner = NSScanner(string: opacityString);
            rScanner.scanHexInt(&alphaInt)
            alpha = CGFloat(alphaInt) / 255.0;
            
            let remainingRange = hexString.startIndex.advancedBy(3)...hexString.endIndex
            hexString = "#\(hexString.substringWithRange(remainingRange))"
        }
        
        if (hexString.characters.count != 7) {
            print("Requeire hex string of length 7 to create a color.")
            return nil;
        }
        
        let rgb:[CGFloat] = [(1,2), (3, 4), (5,6)]
            .map({ hexString.startIndex.advancedBy($0.0)...hexString.startIndex.advancedBy($0.1) })
            .map({ hexString.substringWithRange($0) })
            .map({ "0x\($0)" })
            .map({
                
                var value:UInt32 = 0
                let scanner = NSScanner(string: $0)
                scanner.scanHexInt(&value)
                
                return CGFloat(value) / 255.0
            })
        
        self.init(red: rgb[0], green: rgb[1], blue: rgb[2], alpha: alpha)
    }
}