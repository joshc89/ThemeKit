#ThemeKit

### Compiling Licensed Copies

0. Update `LicenseChecker.swift` to contain the necessary bundle ids. This should include test variants.
0. Remove the `_Archive` folder if it exists, clean the project and framework, and clean the build folder.
0. Change the optimisation level to "Fastest, Smallest" for the debug build.
0. Run the demo app target on the simulator to create the debug framework, compiled for use on the simulator.
0. Archvie `ThemeKit.framework`.
0. Copy the newly created `_Archive` to the desired location.
0. Distribute the Release and Debug frameworks to the client.

For further details read [iOS 9 Universal Cocoa Touch Frameworks by kodmunki](https://kodmunki.wordpress.com/2015/09/22/ios-9-universal-cocoa-touch-frameworks/).