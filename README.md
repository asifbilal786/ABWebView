# ABWebView
A utility control which is using fast WKWebView in replacement of UIWebView which is introduced in iOS8. Just set URL to load and it will do the rest. Very easy to implement. This is very useful when loading 'Terms of Services' OR 'Privacy Policy' web pages.

## Demo
![Alt text](http://i.imgur.com/pwTgDH8.gifv "")

## Requirements

- iOS 8 and above.
- Xcode 8 and above


## Adding ABWebViewController to your project

### METHOD 1:
1. Add a pod entry for `ABWebView` to your Podfile

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'ABWebView', '~> 0.1'
``` 

2. Install the pod(s) by running `pod install`.

### MEHTOD 2: (Source files)
Alternatively, you can directly add all files under the folder Core to your project.

1. Download the [latest code version](https://github.com/asifbilal786/ABWebViewController/archive/master.zip) or add the repository as a git submodule to your git-tracked project.
2. Open your Xcode project, then drag and drop source directory onto your project. Make sure to select Copy items when asked if you extracted the code archive outside of your project.
 

## Usage

Create instance of ABWebViewConroller and set URLToLoad.

```
let webViewController = ABWebViewController()
webViewController.URLToLoad = "https://apple.com"
navigationController?.pushViewController(webViewController, animated: true)
```

See example projects for detail.

## License
This code is distributed under the terms and conditions of the [MIT license](LICENSE). 

