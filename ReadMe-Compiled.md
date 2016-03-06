#ThemeKit

Thank you for using ThemeKit. Its goal is speed up your UI stying by defining text and colour styles referenced using simple enums. You can even see your theme reflected in Interface Builder. Changes to your app's branding can be made in a view lines, and applied instantly across all of your themed views, and white labelling your app becomes trivial.

To get started then follow the instructions below to integrate ThemeKit into your own projects. Comprehensive documentation can be found within the ThemeKit directory.

I hope you have a great time using ThemeKit. 

### Linking With ThemeKit

0. Copy the distributed ThemeKit directory into your project directory. These instructions assume the directory has been copied to a "Libraries" directory at the project root.
0. Add `"$(PROJECT_DIR)/Libraries/ThemeKit/$(CONFIGURATION)"` to the **Runpath Search Paths** and **Framework Search Paths** in your target's **Build Settings**. (If your have multiple configurations, either copy the 'Debug' or 'Release' directory with ThemeKit and rename it to your configuration, or specify 'Debug' / 'Release' instead of `"${CONFIGURATION}"` for each configuration.) 
0. Add 'ThemeKit.framework' from the 'Release' subdirectory of ThemeKit to your target's **Embedded Binaries** section. This should also add 'ThemeKit.framework' to the **Linked Frameworks and Libraries** section.
0. If `"$(PROJECT_DIR)/Libraries/ThemeKit/Release` has been added to the **Framework Search Paths** Build Setting as a duplicate, remove it.

At this point your app should build and run and you can configure your own Theme!

### Theme Configuration

0. Add a new '.swift' file to your Xcode project to contain your new Theme.
0. Create your own Theme based on the 'MyTheme.swift' template file.
0. Subclass `TKThemeVendor` as in 'MyTheme.swift'.
0. In your AppDelegate's `application(application:didFinishLaunchingWithOptions:)`, add `let _ = MyThemeVendor.shared()`. This ensures the `TKThemeVendor` singleton used in ThemeKit is yours, and returns the correct Theme.
0. Copy the extension to the `IBThemeable` protocol from MyTheme.swift and ensure it returns a new instance of your theme. This provides ThemeKit subclasses with a reference to your Theme from Interface Builder.
0. Add the 'IBInspectable' directory within ThemeKit to your Xcode project, ensuring the files are added to your target. These files are subclasses of the core ThemeKit files for use in Interface Builder. (Xcode 7 requires 'IBDesignable' classes and their 'IBInspectable' properties to be source, so these classes cannot be included in the compiled framework.)

You can now use the UIKit component subclasses from the 'IBInspectable' folder to develop. 

### Unit Tests

Unit tests in Xcode 7 require a few further changes.

0. Set **Defines Module** to **YES** in your target's **Build Settings**. 
0. Add `"${PROJECT_DIR}/Libraries/ThemeKit/${CONFIGURATION}"` to your test target's **Build Settings**.

For further details on combining this compiled framework with others, or how to create your own compiled frameworks, see [iOS 9 Universal Cocoa Touch Frameworks by kodmunki](https://kodmunki.wordpress.com/2015/09/22/ios-9-universal-cocoa-touch-frameworks/). ThemeKit was compiled using the method detailed therein.