//
//  TKButton.swift
//  ThemeKit
//
//  Created by Josh Campion on 02/08/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import Foundation

@IBDesignable
public class TKButton: UIButton {
    
    
    @IBInspectable var tintColourId:String?
    @IBInspectable var textStyleId:String?
    
    /*
    public override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    
    let mat = MaterialTheme()
    applyTheme(mat)
    }
    
    public override func awakeFromNib() {
    super.awakeFromNib()
    
    let mat = MaterialTheme()
    applyTheme(mat)
    }
    */
    
    func applyTheme(theme:Theme) {
        
        if let colourID = tintColourId,
            let style = ColourStyle(rawValue: colourID) {
                self.tintColor = theme.colour(style)
        }
        
        if let textStyleId = self.textStyleId,
            let textStyle = TextStyle(rawValue: textStyleId) {
                titleLabel?.font = theme.font(textStyle)
        }
    }
    
    public override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        // TODO: Re-implement when using
        //        applyTheme()
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    
    public override func willMoveToWindow(newWindow: UIWindow?) {
        super.willMoveToWindow(newWindow)
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
    }
    
    /*
    public override var tintColor:UIColor! {
    get {
    return UIColor.greenColor()
    }
    set {
    super.tintColor = newValue
    }
    }
    */
    
    public override func tintColorDidChange() {
        super.tintColorDidChange()
    }
    
    
}