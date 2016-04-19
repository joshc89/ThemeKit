//
//  Licenses.swift
//  ThemeKit
//
//  Created by Josh Campion on 31/01/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

/// Protocol to ensure each class has a `_Checker` object associated with it.
protocol Checking {
    var checker:_Checker { get }
}

public final class ThemeKit {
    
    public final class func setLicenseKey(key:String) {
        _Checker.licenseKey = key
    }
}

/// Ensures the app identier of the running app matches that which this framework has been compiled for.
final class _Checker: NSObject {
    
    private static let key = "laSd23jC7dl8Gb"
    
    private static var licenseKey:String = "" {
        didSet {
            validLicenseKey = checkLicenseKey()
        }
    }
    
    private static var validLicenseKey:Bool = false
    
    private static let alwaysValid = [
        "uk.co.joshcampion.ThemeKitDemo",
        "com.apple.InterfaceBuilder.IBCocoaTouchPlugin.IBCocoaTouchTool"
    ]
    
    private let email = "joshcampion89@gmail.com"
    
    private class func checkLicenseKey() -> Bool {
        
        let deviceName = UIDevice.currentDevice().name
        print("Running on: \(deviceName)")
        
        if licenseKey == "Simulator" && deviceName.containsString("Simulator") {
            //return true
        }
        
        let bundleID = NSBundle.mainBundle().bundleIdentifier
        
        guard var bID = bundleID else {
            fatalError("Invalid set up. ThemeKit requires a Bundle ID")
        }
        
        if bID.hasSuffix("UITests"),
            let r = bID.rangeOfString("UITests") {
            bID.removeRange(r)
        }
        
        if bID.hasSuffix("Tests"),
            let r = bID.rangeOfString("UITests") {
            bID.removeRange(r)
        }
        
        if alwaysValid.contains(bID) {
            // nothing to see here
            return true
        }
        
        // check the encoded version matches the license key
        let hash = bID.digestUsingAlgorithm(.SHA1, key: key)
        
        guard hash == licenseKey else {
            // all is ok
            return true
        }
        
        return false
    }
    
    override init() {
        super.init()
        
        _Checker.validLicenseKey = _Checker.checkLicenseKey()
        
        if !_Checker.validLicenseKey {
            fatalError("Invalid License Key for: \(NSBundle.mainBundle().bundleIdentifier). Contact \(email) to get a licensed copy.")
        }
    }
    
}