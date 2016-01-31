//
//  Licenses.swift
//  ThemeKit
//
//  Created by Josh Campion on 31/01/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

/// Protocol to ensure each class has a `_Checker` object associated with it.
protocol Checking {
    var checker:_Checker { get }
}

/// Ensures the app identier of the running app matches that which this framework has been compiled for.
final class _Checker: NSObject {
    
    private static let identifiers = [
        "uk.co.joshcampion.ThemeKitDemo"
    ]
    
    private static let email = "joshcampion89@gmail.com"
    
    override final class func initialize() {
        if self == _Checker.self {
            
            let bundleID = NSBundle.mainBundle().bundleIdentifier
            
            guard let bID = bundleID where identifiers.contains(bID) else {
                print("This version of ThemeKit is not licensed for bundle id: \(NSBundle.mainBundle().bundleIdentifier). Contact \(email) to get a licensed copy.")
                abort()
            }
        }
    }
}