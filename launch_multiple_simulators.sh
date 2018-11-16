#!/bin/bash

BUNDLE_IDENTIFIER="example.CustomSimulatorsExample"
PROJECT_NAME="CustomSimulatorsExample"
TARGET_NAME="CustomSimulatorsExample"

xcrun simctl shutdown all

APP=$(find ~/Library/Developer/Xcode/DerivedData/${PROJECT_NAME}-*/Build/Products/Debug-iphonesimulator -name "${TARGET_NAME}.app" | head -n 1)
echo "Launching ${APP} in multiple simulators.."

filename=MultiSimConfig.txt
grep -v '^#' $filename | while read -r line
do
  echo $line
  xcrun instruments -w "$line"
  xcrun simctl install booted $path
  xcrun simctl launch booted ${BUNDLE_IDENTIFIER}
done
