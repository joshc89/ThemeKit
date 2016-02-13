#!/bin/sh

#  GenerateThemeKit.sh
#  ThemeKit
#
#  Created by Josh Campion on 07/02/2016.
#  Copyright © 2016 Josh Campion. All rights reserved.

## Declare the IDs this version can be used for

declare -a ALWAYS_LICENSED=(
"uk.co.joshcampion.ThemeKitDemo"
"com.apple.InterfaceBuilder.IBCocoaTouchPlugin.IBCocoaTouchTool"
)

declare -a LICENSED_IDS=(
"com.virgintrainseastcoast.CloseCallCapture"
"com.virgintrainseastcoast.CloseCallCaptureTests"
"com.virgintrainseastcoast.CloseCallCaptureUITests"
)

ALL_LICENSED=("${ALWAYS_LICENSED[@]}" "${LICENSED_IDS[@]}")

## Create the swift file used to compile the framework with
LICENSE_SWIFT="let licensedIdentifiers = [\n"

for i in "${ALL_LICENSED[@]}"
do
LICENSE_SWIFT+="\t\"${i}\",\n"
done
LICENSE_SWIFT+="]"

echo "$LICENSE_SWIFT" > 'ThemeKit/ThemeKit/Support Files/LicenseIDs.swift'

## Compile Xcode project to create the .framework

## Create the complete framework

COMPILED_PATH='ThemeKit.framework'
mkdir $COMPILED_PATH

## Move the Archived files...

cp -r 'ThemeKit/_Archive/Debug' $COMPILED_PATH
cp -r 'ThemeKit/_Archive/Release' $COMPILED_PATH

# rm 'ThemeKit/_Archive'

## Copy the pod spec

cp 'ThemeKit.podspec' "$COMPILED_PATH/Debug"
cp 'ThemeKit.podspec' "$COMPILED_PATH/Release"

## Copy the device compiled files into the DEBUG folder

for comp in "$COMPILED_PATH/Release/ThemeKitCore.framework/Modules/ThemeKitCore.swiftmodule/*"
do
cp $comp "$COMPILED_PATH/Debug/ThemeKitCore.framework/Modules/ThemeKitCore.swiftmodule/"
done

## Copy the licensed files

cp -r 'ThemeKit/ThemeKitDemo/IBInspectable' $COMPILED_PATH
cp 'LICENSE' $COMPILED_PATH

LICENSED_BUNDLE_ID_TEXT="ThemeKit is licensed as defined in 'LICENSE' for iOS apps with the following BundleIDs:\n"


## now loop through the above array
for i in "${LICENSED_IDS[@]}"
do
#echo "$i"
LICENSED_BUNDLE_ID_TEXT+="\n* $i"
done
echo $LICENSED_BUNDLE_ID_TEXT > $COMPILED_PATH/LicensedBundleIDs.txt


