![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20tvOS-lightgrey)
[![License](https://img.shields.io/badge/license-mit-blue.svg)](https://doge.mit-license.org)

## Overview

PureLogger is an elegant replacement of ```Swift.print()``` in the Xcode project to use during the debugging.

## Presentation
<p align="left">
<img src="https://github.com/Kharauzov/PureLogger/blob/master/debugWindow.png" width="700px" height="143px"/>
</p>

## Installation

### CocoaPods

```ruby
pod 'PureLogger'
```

### Manually

Just copy **Source** folder to your Xcode project.

## How To

**Method #1 - Globally**

After adding the framework to your project, you need to import the module in your AppDelegate class.
```swift
import PureLogger
```
Then add this line just below
```swift
let log = Log.shared
```
After this you can access ```log``` istance across all project.
```swift
log.debug("Testing debug log")
```

**Method #2 - Locally**

After adding the framework to your project, you need to import the module in the every class, you wish to use the logger.
```swift
import PureLogger
```
Then you need to initialise the local logger like this
```swift
let log = Log()
```
After this you can access ```log``` istance in the appropriate class.

**Available methods**
```swift
log.debug(...)
log.info(...)
log.warning(...)
log.error(...)
```

Also you can use such logic, if you want to print only input item itself without any additional information.
```swift
Log("Simple log")
```

Besides this, you can customize emoji, date format and other things at the output information to fit your demands 😉

## Feedback
If you have any questions or suggestions, feel free to open issue just at this project.

## License
PureLogger and all its classes are available under the MIT license. See the LICENSE file for more info.
