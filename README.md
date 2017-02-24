# SSHoneyCombView

[![CI Status](http://img.shields.io/travis/samehsalama@hotmail.com/SSHoneyCombView.svg?style=flat)](https://travis-ci.org/samehsalama@hotmail.com/SSHoneyCombView)
[![Version](https://img.shields.io/cocoapods/v/SSHoneyCombView.svg?style=flat)](http://cocoapods.org/pods/SSHoneyCombView)
[![License](https://img.shields.io/cocoapods/l/SSHoneyCombView.svg?style=flat)](http://cocoapods.org/pods/SSHoneyCombView)
[![Platform](https://img.shields.io/cocoapods/p/SSHoneyCombView.svg?style=flat)](http://cocoapods.org/pods/SSHoneyCombView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Minimum iOS 8, Swift 3

## Installation

SSHoneyCombView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SSHoneyCombView'
```

Make sure to: 
use_frameworks!

## Usage

1- add SSHoneyCombView.framework to “Linked Frameworks and Libraries” under Target->General, and build

storyboard:
2- drag and drop a UIView and change both “Class” and “Module” to SSHoneyCombView

3- resize your SSHoneyCombView and add constraints to use Autoresizing

4- create and outlet in your ViewController (Ex. ssHoneyCombView)

in ViewController:

5- import HoneyCombView

6- create and array of SSHoneyCombObject and assign this array to self.ssHoneyCombView.honeyCombObjects

7- optional you can set 

self.honeyCombView.numberOfItemsInRow 
//NOTE: numberOfItemsInRow can’t be less than 2

8- conform to SSHoneyCombViewDelegate

9- func honeyComb(_ honeyComb: HoneyCombView, didSelect item: HoneyCombObject) {
print(item.name)
}


finally you can add variables to HoneyCombObject class to fit your needs
basic HoneyCombObject has “name” property only


for more details, please refer to Example Project

## Author

samehsalama@hotmail.com, samehsalama@hotmail.com

## License

SSHoneyCombView is available under the MIT license. See the LICENSE file for more info.
