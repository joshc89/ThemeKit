#ThemeKit

Thank you for using ThemeKit. Its goal is speed up your UI stying by defining text and colour styles referenced using simple enums. You can even see your theme reflected in Interface Builder. Changes to your app's branding can be made in a view lines, and applied instantly across all of your themed views, and white labelling your app becomes trivial.

To get started then follow the instructions below to integrate ThemeKit into your own projects. Comprehensive documentation can be found within the ThemeKit directory.

I hope you have a great time using ThemeKit. 

### Linking With ThemeKit

The ThemeKit framework was built using [Carthage](), and it is best to integrate it into your app as if it had been added to your cartfile.

0. Copy the distributed ThemeKit directory into your project directory. These instructions assume the directory has been copied to a "Libraries" directory at the project root.
0. Add 'ThemeKit.framework' to your target's **Embedded Binaries** section. This should also add 'ThemeKit.framework' to the **Linked Frameworks and Libraries** section.
0. Add *$(SRCROOT)/Libraries/ThemeKit/Build/iOS/ThemeKitCore.framework* as an input for the Carthage run script build phase. 

At this point your app should build and run and you can configure your own Theme!

### Theme Configuration

0. Add a new '.swift' file to your Xcode project to contain your new Theme.
0. Create your own Theme based on the 'MyTheme.swift' template file.
0. Subclass `TKThemeVendor` as in 'MyTheme.swift'.
0. In your AppDelegate's `application(application:didFinishLaunchingWithOptions:)`, add `let _ = MyThemeVendor.shared()`. This ensures the `TKThemeVendor` singleton used in ThemeKit is yours, and returns the correct Theme.
0. Copy the extension to the `IBThemeable` protocol from MyTheme.swift and ensure it returns a new instance of your theme. This provides ThemeKit subclasses with a reference to your Theme from Interface Builder.
0. Add the 'IBInspectable' directory within ThemeKit to your Xcode project, ensuring the files are added to your target. These files are subclasses of the core ThemeKit files for use in Interface Builder. (Xcode 7 requires 'IBDesignable' classes and their 'IBInspectable' properties to be source, so these classes cannot be included in the compiled framework.)

You can now use the UIKit component subclasses from the 'IBInspectable' folder to develop. 
