//
//  UISearchBar+TKExtensions.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    
    /**
     
     Safe convenience function for accessing the `UITextField` contained in a `UISearchBar`.
     
     - returns: The `UITextField` backing this `UISearchBar` or `nil` if none is found.
    */
    func containedTextField() -> UITextField? {
        
        var textField:UITextField?
        iterateSubviews { (view:UIView, inout stop:Bool) -> () in
            if let tf = view as? UITextField {
                textField = tf
                stop = true
            }
        }
        
        return textField
    }
}