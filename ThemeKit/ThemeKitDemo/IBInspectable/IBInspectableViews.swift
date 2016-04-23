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

// MARK: - Views

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

// MARK: - Controls

@IBDesignable
public class ThemeButton: TKButton, IBThemeable {
    
    @IBInspectable
    override public var backgroundColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textColourStyleId:String? { didSet { } }
}

@IBDesignable
public class ThemeSegmentedControl: TKSegmentedControl, IBThemeable {
    
    @IBInspectable
    override public var backgroundColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textColourStyleId:String? { didSet { } }
}

@IBDesignable
public class ThemeSlider: TKSlider, IBThemeable {
    
    @IBInspectable override public var thumbTintColourStyleId:String? { didSet { }    }
    
    @IBInspectable override public var minimumTrackTintColourStyleId:String? { didSet { }    }
    
    @IBInspectable override public var maximumTrackTintColourStyleId:String? { didSet { }    }
}

@IBDesignable
public class ThemeStepper: TKStepper, IBThemeable {
    
    @IBInspectable
    override public var backgroundColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
}

@IBDesignable
public class ThemeSwitch: TKSwitch, IBThemeable {
    
    @IBInspectable
    override public var thumbTintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var onTintColourId:String? { didSet { } }
}

// MARK: - Text

@IBDesignable
public class ThemeLabel: TKLabel, IBThemeable {
    
    @IBInspectable
    override public var backgroundColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textStyleId:String?  { didSet { } }
    
    @IBInspectable
    override public var textColourStyleId:String? { didSet { } }
    
}

@IBDesignable
public class ThemeTextField: TKTextField, IBThemeable {
    
    @IBInspectable
    override public var backgroundColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textStyleId:String?  { didSet { } }
    
    @IBInspectable
    override public var textColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var placeholderTextStyleId:String?  { didSet { } }
    
    @IBInspectable
    override public var placeholderTextColourStyleId:String? { didSet { } }
}

@IBDesignable
public class ThemeTextView: TKTextView, IBThemeable {
    
    @IBInspectable
    override public var backgroundColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textColourStyleId:String?  { didSet { } }
}

// MARK: - Navigation

@IBDesignable
public class ThemeBarButtonItem: TKBarButtonItem, IBThemeable {
    
    @IBInspectable
    override public var textStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textColourStyleId:String? { didSet { } }
}

@IBDesignable
public class ThemeNavigationBar: TKNavigationBar, IBThemeable {
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var barTintColourStyleId:String? { didSet { } }
}

@IBDesignable
public class ThemeTabBar: TKTabBar, IBThemeable {
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var barTintColourStyleId:String? { didSet { } }
}

@IBDesignable
public class ThemeTabBarItem: TKTabBarItem, IBThemeable {
    
    @IBInspectable
    override public var textStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var textColourStyleId:String? { didSet { } }
}

@IBDesignable
public class ThemeToolbar: TKToolbar, IBThemeable {
    
    @IBInspectable
    override public var tintColourStyleId:String? { didSet { } }
    
    @IBInspectable
    override public var barTintColourStyleId:String? { didSet { } }
}


