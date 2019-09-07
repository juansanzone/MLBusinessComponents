![Screenshot iOS](https://github.com/juansanzone/MLBusinessComponents/blob/refactor/Documentation/images/ios_cover.png?raw=true)
<p align="center">
<a href="https://app.bitrise.io/">
<img src="https://app.bitrise.io/app/d2d19a45654ed1d8/status.svg?token=9BWGNvo1MwPKFb2wQB2dCg">
</a>
<img src="https://img.shields.io/badge/Swift-4.2-orange.svg" />
<a href="https://cocoapods.org/pods/MLBusinessComponents">
<img src="https://img.shields.io/cocoapods/v/MercadoPagoSDK.svg" alt="CocoaPods" />
</a>
<a href="https://cocoapods.org/pods/MLBusinessComponents">
<img src="https://img.shields.io/cocoapods/dt/MLBusinessComponents.svg?style=flat" alt="CocoaPods downloads" />
</a>
</p>

## 📲 How to Install

#### Using [CocoaPods](https://cocoapods.org)

Edit your `Podfile` and specify the dependency:

```ruby
pod 'MLBusinessComponents'
```

## 🐒 How to use

### 1 - Import into project.
```swift
import MLBusinessComponents
```

### 2 - Use your UI component.
Choose and initialize the componentes. Each component is a subclass of UIView.


## 👔 UI COMPONENTS
```swift
MercadoPagoCheckout.init(builder: MercadoPagoCheckoutBuilder.init(publicKey: "your_public_key", preferenceId: "your_checkout_preference_id")).start(navigationController: self.navigationController)
```

## 🎨 UI Custom Colors
### Basic color customization
You can define one color (your main color) and we will take care of the rest. Delivering the best Checkout experience based on your color.
```swift
checkoutBuilder.setColor(checkoutColor: UIColor.purple)
```

### Advanced color customization
If you need an advanced color customization, you can customize your colors through our `PXTheme` interface/protocol. Check the  <a href="http://mercadopago.github.io/px-ios/v4/Protocols/PXTheme.html" target="_blank"> `PXTheme` methods in our reference guide. </a>

The following example implements the protocol `PXTheme` to customize the UI with Mercadolibre style:
```swift
final class ExampleTheme: PXTheme {
let primaryColor: UIColor = #colorLiteral(red: 1, green: 0.9176470588, blue: 0.4705882353, alpha: 1)

public func navigationBar() -> PXThemeProperty {
return PXThemeProperty(backgroundColor: primaryColor, tintColor: #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1))
}

public func loadingComponent() -> PXThemeProperty {
return PXThemeProperty(backgroundColor: primaryColor, tintColor: #colorLiteral(red: 0.2039215686, green: 0.5137254902, blue: 0.9803921569, alpha: 1))
}

public func highlightBackgroundColor() -> UIColor {
return primaryColor
}

public func detailedBackgroundColor() -> UIColor {
return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}

public func statusBarStyle() -> UIStatusBarStyle {
return .default
}
}
```

## 🔠 Custom Fonts
You can set your custom Font by `PXTheme` protocol. Implement the following 3 optional methods:
```swift
@objc optional func fontName() -> String?
@objc optional func lightFontName() -> String?
@objc optional func semiBoldFontName() -> String?
```

## 📈 Tracking
We provide `PXTrackerListener` protocol to notify each tracking event. You can subscribe to this protocol using `PXTracker`.

### Implement PXTrackerListener protocol.
```swift
@objc public protocol PXTrackerListener: NSObjectProtocol {
func trackScreen(screenName: String, extraParams: [String: Any]?)
func trackEvent(screenName: String?, action: String!, result: String?, extraParams: [String: Any]?)
}
```

### Set listener
```swift
PXTracker.setListener(self)
```

### 😉 Next steps?
* [ ] Bitrise for releases
* [ ] Codebeat integration
* [ ] Snapshot Test cases
* [ ] SwiftLint
* [ ] Migration to Swift 5
* [ ] SwiftUI bridges UIKit <-> SwiftUI
More UI componentes every month 😈

### 📋 Supported OS & SDK Versions
* iOS 10.0+
* Swift 4.2
* xCode 9.2+
* @Objc full compatibility

### 🔮 Project Example
This project include a Swift example project using `MLBusinessComponents` basic components.

### 📚 Full Documentation
+ [Advanced full documentation](http://TBD)

## ❤️ Feedback
Feel free to contribute or send feedback.
Fork this project and propose your own fixes, suggestions and open a pull request with the changes.

## 👨🏻‍💻 Author
Juan Sanzone / @juansanzone
Esteban Boffa / @eboffa

## 👮🏻 License

```
MIT License

Copyright (c) 2019 - Mercado Pago / Mercado Libre

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
