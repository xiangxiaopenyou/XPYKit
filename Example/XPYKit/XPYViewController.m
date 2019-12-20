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

@interface XPYViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *items;

@end

@implementation XPYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
