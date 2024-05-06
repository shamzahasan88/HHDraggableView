# HHDraggableView

[![CI Status](https://img.shields.io/travis/shamzahasan88/HHDraggableView.svg?style=flat)](https://travis-ci.org/shamzahasan88/HHDraggableView)
[![Version](https://img.shields.io/cocoapods/v/HHDraggableView.svg?style=flat)](https://cocoapods.org/pods/HHDraggableView)
[![License](https://img.shields.io/cocoapods/l/HHDraggableView.svg?style=flat)](https://cocoapods.org/pods/HHDraggableView)
[![Platform](https://img.shields.io/cocoapods/p/HHDraggableView.svg?style=flat)](https://cocoapods.org/pods/HHDraggableView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation With CocoaPods

HHDraggableView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HHDraggableView'
```

## Installation With Swift Package Manager

`HHDraggableView` can be installed using Swift Package Manager.

1. In Xcode open **File/Swift Packages/Add Package Dependency...** menu.

2. Copy and paste the package URL:

```
https://github.com/shamzahasan88/HHDraggableView.git
```

## Preview

![](https://reignsol.com/public/github-assets/hhdraggableview.gif)

## How to use

### UIView
- Add an UIView in storyboard and assign it `HHDraggableUIView` or create `HHDraggableUIView` in swift directly

### Properties
- `isDraggable` | `Bool` | `Default: true` (UIView should be able to move or not)
- `applyInertia` | `Bool` | `Default: true` (Either UIView should move at the end of dragging by itself or not)
- `inertiaDuration` | `CGFloat` | `Default: 1.5` (Duration for how long should inertia last)
- `friction` | `CGFloat` | `Default: 2.0` (Value that affects inertia, more friction, quicker inertia will end)
- `keepInScreen` | `Bool` | `Default: true` (Either UIView should be kept with in the screen or should go outside as well)
- `snapToSides` | `Bool` | `Default: false` (Either the UIView should move to either side of screen or not)

### It is highly recommended to use either `applyInertia` or `snapToSides`. DO NOT use or make both of them `true` at a time

## Author

Hamza Hasan, shamzahasan88@gmail.com

## License

HHDraggableView is available under the MIT license. See the LICENSE file for more info.
