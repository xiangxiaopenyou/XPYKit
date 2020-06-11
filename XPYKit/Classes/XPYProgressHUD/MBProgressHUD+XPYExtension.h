//
//  MBProgressHUD+XPYExtension.h
//  MBProgressHUD
//
//  Created by zhangdu_imac on 2020/6/9.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (XPYExtension)

/// 显示默认进度框
+ (instancetype)xpy_showHUD;

/// 显示默认进度框和提示文字
/// @param tips 提示文字
+ (instancetype)xpy_showHUDWithTips:(NSString *)tips;

/// 在指定View上显示进度框
/// @param view 目标View
+ (instancetype)xpy_showHUDForView:(UIView *)view;

/// 在指定View上显示进度框和提示文字
/// @param view 目标View
/// @param tips 提示文字
+ (instancetype)xpy_showHUDForView:(UIView *)view tips:(NSString *)tips;

/// 简单文字提示，一秒后自动消失
/// @param tips 提示信息
+ (instancetype)xpy_showTips:(NSString *)tips;

/// 成功提示，一秒后自动消失
/// @param successTips 成功提示信息
+ (instancetype)xpy_showSuccessTips:(NSString *)successTips;

/// 错误提示，一秒后消失
/// @param errorTips 失败提示信息
+ (instancetype)xpy_showErrorTips:(NSString *)errorTips;

/// 隐藏进度框
+ (void)xpy_dismissHUD;

/// 隐藏指定View上的进度框
/// @param view 目标View
+ (void)xpy_dismissHUDForView:(UIView *)view;



@end

NS_ASSUME_NONNULL_END
