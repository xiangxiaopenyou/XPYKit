# XPYKit

[![CI Status](https://img.shields.io/travis/xiangxiaopenyou/XPYKit.svg?style=flat)](https://travis-ci.org/xiangxiaopenyou/XPYKit)
[![Version](https://img.shields.io/cocoapods/v/XPYKit.svg?style=flat)](https://cocoapods.org/pods/XPYKit)
[![License](https://img.shields.io/cocoapods/l/XPYKit.svg?style=flat)](https://cocoapods.org/pods/XPYKit)
[![Platform](https://img.shields.io/cocoapods/p/XPYKit.svg?style=flat)](https://cocoapods.org/pods/XPYKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 8.0

## Installation

XPYKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XPYKit'
```

## Usage

1、Alert

    [XPYAlertManager showAlertWithTitle:@"Alert" message:@"Alert" cancel:@"取消" confirm:@"确定" inController:self confirmHandler:^{

        NSLog(@"alert confirm");
    
    } cancelHandler:^{

        NSLog(@"alert cancel");
    
    }];

2、ActionSheet

    [XPYAlertManager showActionSheetWithTitle:@"ActionSheet" message:@"ActionSheet" cancel:@"取消" inController:self actions:@[@"item0", @"item1", @"item2"] actionHandler:^(NSInteger index) {

        NSLog(@"click item%@", @(index));
    
    }];

3、CopyLabel

    XPYCopyLabel *label = [[XPYCopyLabel alloc] initWithFrame:CGRectMake(200, 200, 100, 50)];
    
    label.text = @"点我复制";
    
    [label sizeToFit];
    
    label.isCanCopy = YES;
    
    label.selelctedBackgroundColor = [UIColor grayColor];
    
![copylabel](Example/ExampleImages/copy_label.gif)

## Author

xiangxiaopenyou, xlp921123@163.com

## License

XPYKit is available under the MIT license. See the LICENSE file for more info.
