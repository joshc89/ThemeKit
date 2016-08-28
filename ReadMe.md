# ThemeKit

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Fast, flexible, native styling for iOS.

## Features

- [x] Simple theme definitions
- [x] Fully native syntax - no CSS / HTML required
- [x] Accessibility Support by default
- [x] Live Interface Builder updates
- [x] Easily support [Material Design Guidelines](https://www.google.com/design/spec/style)
- [x] Hex UIColor support

## Requirements

* iOS 8.0+
* Xcode 7.3+

* *tvOS support coming soon*

## Getting Started

Develop without worrying about maintaining and updating for design consistency. Change your app's branding in a few lines. Prototype style choices quickly with results applied instantly in Interface Builder. White label your app with full reuse of Storyboards.

ThemeKit can speed up your development workflow and make developing alongside designers easy. To get started follow the instructions below to integrate ThemeKit into your own project. Comprehensive documentation can be found within the ThemeKit directory.

ThemeKit is currently in beta with many features planned for coming updates. Contact <joshcampion89@gmail.com> for more details and to obtain a license as part of the Beta.

Thanks for using ThemeKit - have a great time using it. 

### Installation

ThemeKit is built with [Carthage](https://github.com/Carthage/Carthage) and should be installed using it. Add:

	github "ThemeKit/ThemeKit"

to your `Cartfile` then run:

	carthage update ThemeKit
	
and drag the downloaded `ThemeKitCore.framework` from `Carthage/Build/iOS` to your your app's **Linked Frameworks and Libraries** section. 

Add **$(PATH_TO_BUILD)/ThemeKitCore.framework** as an input for the Carthage run script build phase. 

For up to date details, go see the [Carthage Documentation](https://github.com/Carthage/Carthage).

Download the contents of the **IBInspectable** folder in this repo and add then to your Xcode target. 

* 'MyTheme.swift' is where you can configure the fonts and colours that will make your Theme.
* 'IBInspectableViews.swift' defines subclasses that provide give InterfaceBuilder support. 
	* *Xcode 7 requires 'IBDesignable' classes and their 'IBInspectable' properties to be compiled from source in the same project as the Storyboard they are to be rendered in, so these classes cannot be included in the compiled framework.*

In your AppDelegate's

	application(application:didFinishLaunchingWithOptions:) 
	
method, add 

	let _ = MyThemeVendor.shared()
	
This ensures the `TKThemeVendor` singleton referenced within ThemeKit is yours, and returns the correct Theme. Your app should now build and run and you can begin developing your Theme!

### Theme Configuration

ThemeKit styles are based on the `TextStyle` and `ColourStyle` enums, whose cases are based on [Google Material Design Guidelines](https://www.google.com/design/spec/style) - an excellent resource for applying good design principles to your app. Your theme will return a font name `String` and `UIColor` for each style enum. 

See 'MyTheme.swift' for more details.

ThemeKit also includes convenience methods for creating `UIColor`s from hex strings, making it easy to create colours from the Material Design pallette.

Each UIKit view has a ThemeKit subclass that adds styling property equivalents for ThemeKit Style Enums, enabling you to style without  specifying the exact font, size and colour of each element.

	public class TKLabel: UILabel ... {
	
		public var textStyle: TextStyle?
		public var textColourStyle: ColourStyle?
	
		...
	}

	public class TKButton: UIButton ... {
	
		public var textStyle: TextStyle?
		public var tintColourStyle: ColourStyle?
		public var backgroundColourStyle: ColourStyle?
	
	}

	public class TKSlider: UISlider ... {
	
		public var thumbTintColourStyle: ColourStyle?
		public var minimumTrackTintColourStyle: ColourStyle?
		public var maximumTrackTintColourStyle: ColourStyle?
	}

Each view also has Style ID equivalent properties that can be set from the Storyboard to be the String value of the enum.

	public class TKLabel: UILabel ... {
	
		public var textStyleId: String?
		public var textColourStyleId: String?
	
		...
	}

Either create your views as these subclasses or set the class in Interface Builder and you can set these properties. You can quickly set different values for Text and Colour styles, see them reflected in your Storyboard. 


