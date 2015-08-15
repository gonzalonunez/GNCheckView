# GNCheckView

[![Version](https://img.shields.io/cocoapods/v/GNCheckView.svg?style=flat)](http://cocoapods.org/pods/GNCheckView)
[![License](https://img.shields.io/cocoapods/l/GNCheckView.svg?style=flat)](http://cocoapods.org/pods/GNCheckView)
[![Platform](https://img.shields.io/cocoapods/p/GNCheckView.svg?style=flat)](http://cocoapods.org/pods/GNCheckView)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Using GNCheckView is incredibly simple! It all comes down to one function:

```swift
public func check(shouldCheck:Bool, animated:Bool)
```
For the lazier people in life, here are a couple convinience functions!

```swift
public func checkAnimated(animated:Bool)
public func uncheckAnimated(animated:Bool)
```

For the nitpickier people in life, GNCheckView also comes with several properties that each change the behavior.

```swift
@IBInspectable public var primaryColor = UIColor.blackColor() {
```
This is the color that the checkmark is drawn in.

```swift
@IBInspectable public var secondaryColor = UIColor.whiteColor() {
```
This is what serves as the backgroundColor of the view. See -invertsOnCheck for more.

```swift
@IBInspectable public var initiallyDrawn = false
```
This determines if the checkmark is initially drawn or not.

```swift
@IBInspectable public var showsBorder = true
```
If true, the view automatically has a border around it with a cornerRadius of 5, borderWidth of 2, and a borderColor that matches the primaryColor

```swift
@IBInspectable public var invertsOnCheck = true
```
If true, once checked the view that switches the check to the secondaryColor and the background to the primaryColor, providing for a nice little effect.

Finally, there's a boolean for you to check the state!

```swift
public var checked : Bool {
```

## Installation

GNCheckView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GNCheckView"
```

## Author

Gonzalo Nunez, gonzi@tcpmiami.com

## License

GNCheckView is available under the MIT license. See the LICENSE file for more info.
