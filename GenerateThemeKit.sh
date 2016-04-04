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

ID="My-Hiscox"

# PocketSEO
#declare -a LICENSED_IDS=(
#"io.pocketseo"
#"io.pocketseo.URLMetricsExtension"
#"io.pocketseoTests"
#"io.pocketseoUITests"
#)

declare -a LICENSED_IDS=(
"uk.co.thedistance.My-Hiscox"
"uk.co.thedistance.My-HiscoxTests"
"uk.co.thedistance.My-HiscoxUITests"
)

ALL_LICENSED=("${ALWAYS_LICENSED[@]}" "${LICENSED_IDS[@]}")

## Create a temporary branch to create this release for

git checkout master

LATEST_TAG=$(git describe --abbrev=0)

git branch 'Compiled-${ID}'

## Create the swift file used to compile the framework with
LICENSE_SWIFT="let licensedIdentifiers = [\n"

for i in "${ALL_LICENSED[@]}"
do
LICENSE_SWIFT+="\t\"${i}\",\n"
done
LICENSE_SWIFT+="]"

echo "$LICENSE_SWIFT" > 'ThemeKit/ThemeKit/Support Files/LicenseIDs.swift'

## Compile Xcode project to allow carthage to create the .framework

git commit -m 'Updated License IDs for project ${ID}'
git tag "${LATEST_TAG}.1"

## make carthage use the local git file to compile the .framework with so the new branch doesn't have to be pushed

WD=$(pwd)
echo 'ThemeKitCore "file://${WD}"'
carthage update

## Create the complete framework

COMPILED_PATH="Compiled/${ID}/ThemeKit"
mkdir -p "${COMPILED_PATH}"
mkdir -p "${COMPILED_PATH}/Build/iOS"

## Copy the Archived files...

cp -r 'Carthage/Build/iOS/ThemeKitCore.framework' "${COMPILED_PATH}/Build/iOS"

for f in Carthage/Build/iOS/*.bcsymbolmap
do
cp -r "${f}" "${COMPILED_PATH}/Build/iOS"
done

## Copy the licensed files

cp -r 'ThemeKit/ThemeKitDemo/IBInspectable' $COMPILED_PATH
cp 'LICENSE' $COMPILED_PATH
cp 'ReadMe-Compiled.md' $COMPILED_PATH/ReadMe.md

LICENSED_BUNDLE_ID_TEXT="ThemeKit is licensed as defined in 'LICENSE' for iOS apps with the following BundleIDs:\n"

## now loop through the above array
for i in "${LICENSED_IDS[@]}"
do
#echo "$i"
LICENSED_BUNDLE_ID_TEXT+="\n* $i"
done
echo $LICENSED_BUNDLE_ID_TEXT > $COMPILED_PATH/LicensedBundleIDs.txt


