//
//  XPYCopyLabelViewController.m
//  XPYKit_Example
//
//  Created by zhangdu_imac on 2019/12/20.
//  Copyright © 2019 xiangxiaopenyou. All rights reserved.
//

#import "XPYCopyLabelViewController.h"

#import <XPYCopyLabel.h>

@interface XPYCopyLabelViewController ()

@end

@implementation XPYCopyLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"可长按复制标签";
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor systemBackgroundColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    XPYCopyLabel *label = [[XPYCopyLabel alloc] initWithFrame:CGRectMake(200, 200, 100, 50)];
    label.text = @"点我复制";
    [label sizeToFit];
    label.isCanCopy = YES;
    label.selelctedBackgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
}


@end
