//
//  MBProgressHUD+XPYExtension.m
//  MBProgressHUD
//
//  Created by zhangdu_imac on 2020/6/9.
//

#import "MBProgressHUD+XPYExtension.h"

@implementation MBProgressHUD (XPYExtension)

+ (instancetype)xpy_showHUD {
    return [self showHUDWithTips:nil customView:nil isAutoHide:NO sourceView:nil];
}
+ (instancetype)xpy_showHUDWithTips:(NSString *)tips {
    return [self showHUDWithTips:tips customView:nil isAutoHide:NO sourceView:nil];
}
+ (instancetype)xpy_showHUDForView:(UIView *)view {
    return [self showHUDWithTips:nil customView:nil isAutoHide:NO sourceView:view];
}
+ (instancetype)xpy_showHUDForView:(UIView *)view tips:(NSString *)tips {
    return [self showHUDWithTips:tips customView:nil isAutoHide:NO sourceView:view];
}
+ (instancetype)xpy_showTips:(NSString *)tips {
    return [self showHUDWithTips:tips customView:nil isAutoHide:YES sourceView:nil];
}
+ (instancetype)xpy_showSuccessTips:(NSString *)successTips {
    UIImageView *successImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success_tip"]];
    return [self showHUDWithTips:successTips customView:successImageView isAutoHide:YES sourceView:nil];
}
+ (instancetype)xpy_showErrorTips:(NSString *)errorTips {
    UIImageView *errorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error_tip"]];
    return [self showHUDWithTips:errorTips customView:errorImageView isAutoHide:YES sourceView:nil];
}

/// 所有显示提示框的方法最终走的方法
/// @param tipsString 提示文字
/// @param customView 提示图
/// @param yesOrNo 是否自动隐藏
/// @param sourceView 目标View
+ (instancetype)showHUDWithTips:(NSString *)tipsString
                     customView:(UIView *)customView
                     isAutoHide:(BOOL)yesOrNo
                     sourceView:(UIView *)sourceView {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[self sourceView:sourceView] animated:YES];
    hud.animationType = MBProgressHUDAnimationZoom;
    // 自动消失的是简单文字提示，否则是UIActivityIndicatorView
    hud.mode = customView ? MBProgressHUDModeCustomView : (yesOrNo ? MBProgressHUDModeText : MBProgressHUDModeIndeterminate);
    hud.label.text = tipsString;
    hud.customView = customView;
    hud.removeFromSuperViewOnHide = YES;
    // 设置提示框为纯色
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    // 设置提示框的背景色
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.6];
    if (yesOrNo) {
        [hud hideAnimated:yesOrNo afterDelay:1.f];
    }
    return hud;
}

+ (void)xpy_dismissHUD {
    [self hideHUDForView:[self sourceView:nil] animated:YES];
}
+ (void)xpy_dismissHUDForView:(UIView *)view {
    [self hideHUDForView:view animated:YES];
}

/// 获取当前的目标View
/// @param view 传入的view
+ (UIView *)sourceView:(UIView *)view {
    if (view) {
        return view;
    }
    view = [UIApplication sharedApplication].delegate.window;
    if (!view) {
        view = [UIApplication sharedApplication].windows.lastObject;
    }
    return view;
}

@end
