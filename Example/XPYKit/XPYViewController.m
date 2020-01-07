//
//  XPYViewController.m
//  XPYKit
//
//  Created by xiangxiaopenyou on 12/20/2019.
//  Copyright (c) 2019 xiangxiaopenyou. All rights reserved.
//

#import "XPYViewController.h"
#import "XPYCategoryViewController.h"
#import "XPYCopyLabelViewController.h"
#import <XPYAlertManager.h>
#import <XPYDropdownDefine.h>

@interface XPYViewController () <UITableViewDelegate, UITableViewDataSource, XPYDropdownViewDelegate>

@property (nonatomic, copy) NSArray *items;

@end

@implementation XPYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)dropdownAction:(id)sender {
    XPYDropdownConfigurations *config = [[XPYDropdownConfigurations alloc] init];
    // 背景颜色
    config.mainBackgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    // 下拉菜单颜色
    config.dropdownBackgroundColor = [UIColor blackColor];
    // 分割线颜色
    config.separatorColor = [UIColor whiteColor];
    // cell选中时颜色
    config.cellSelectedColor = [UIColor colorWithWhite:0 alpha:0.2];
    // 文字颜色
    config.titleColor = [UIColor whiteColor];
    // 下拉菜单宽度
    config.dropdownWidth = 130;
    // 箭头左下角在菜单视图的x坐标
    config.arrowOriginX = 100;
    // 隐藏箭头
    //config.arrowHeight = 0;

    XPYDropdownItemModel *model1 = [XPYDropdownItemModel makeModel:1 icon:[UIImage imageNamed:@"menu_write"] title:@"编辑" titleColor:nil];
    XPYDropdownItemModel *model2 = [XPYDropdownItemModel makeModel:2 icon:[UIImage imageNamed:@"menu_share"] title:@"分享" titleColor:nil];
    XPYDropdownItemModel *model3 = [XPYDropdownItemModel makeModel:3 icon:[UIImage imageNamed:@"menu_clear"] title:@"删除" titleColor:nil];
    
    CGFloat pointX = CGRectGetWidth(self.view.bounds) - 50.f;
    CGFloat pointY = [self isIphoneX] ? 88.f : 64.f;
    XPYDropdownView *dropdownView = [[XPYDropdownView alloc] initWithItemsArray:@[model1, model2, model3] configurations:config arrowPoint:CGPointMake(pointX, pointY)];
    dropdownView.delegate = self;
    [dropdownView show];
}

- (BOOL)isIphoneX {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if (@available(iOS 11.0, *)) {
        CGFloat bottomInsets = keyWindow.safeAreaInsets.bottom;
        if (bottomInsets > 0) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - XPYDropdownViewDelegate
- (void)dropdownView:(XPYDropdownView *)sender didClickItem:(XPYDropdownItemModel *)model {
    NSLog(@"点击了下拉菜单-%@", model.itemTitle);
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XPYKitTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XPYKitTableViewCell"];
    }
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            [XPYAlertManager showAlertWithTitle:@"Alert" message:@"Alert" cancel:@"取消" confirm:@"确定" inController:self confirmHandler:^{
                NSLog(@"alert confirm");
            } cancelHandler:^{
                NSLog(@"alert cancel");
            }];
        }
            break;
        case 1: {
            [XPYAlertManager showActionSheetWithTitle:@"ActionSheet" message:@"ActionSheet" cancel:@"取消" inController:self actions:@[@"item0", @"item1", @"item2"] actionHandler:^(NSInteger index) {
                NSLog(@"click item%@", @(index));
            }];
        }
            break;
        case 2: {
            XPYCategoryViewController *categoryController = [[XPYCategoryViewController alloc] init];
            [self.navigationController pushViewController:categoryController animated:YES];
        }
            break;
        case 3: {
            XPYCopyLabelViewController *copyLabelController = [[XPYCopyLabelViewController alloc] init];
            [self.navigationController pushViewController:copyLabelController animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - Getters
- (NSArray *)items {
    if (!_items) {
        _items = @[@"Alert", @"ActionSheet", @"CategoryView", @"CopyLabel"];
    }
    return _items;
}

@end
