//
//  MBProgressHUD+Show.h
//  Tim
//
//  Created by Yue on 2017/3/14.
//  Copyright © 2017年 Yue. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Show)

//显示HUD无按钮信息
+ (void)showHUDMessage:(NSString *)message;
//显示HUD动画成功、失败信息
+ (void)showHUDMessage:(NSString *)message msgType:(BOOL)isSuccess;

//显示自定文字加载框
+ (void)showHUDLoadingView:(NSString *)message;
//显示加载框
+ (void)showHUDLoadingView;
//隐藏加载框
+ (void)stopHUDLoadingView;

@end
