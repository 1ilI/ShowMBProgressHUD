//
//  MBProgressHUD+Show.m
//  Tim
//
//  Created by Yue on 2017/3/14.
//  Copyright © 2017年 Yue. All rights reserved.
//

#import "MBProgressHUD+Show.h"

#define AfterDelay 2.0

@implementation MBProgressHUD (Show)

#pragma - mark 显示HUD无按钮信息
+ (void)showHUDMessage:(NSString *)message{
    if (!message || [@"" isEqualToString:message]) {
        return;
    }
    MBProgressHUD *hud = [self initMBProgressHUD:message];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:AfterDelay];
}

#pragma - mark 显示HUD动画成功、失败信息
+ (void)showHUDMessage:(NSString *)message msgType:(BOOL)isSuccess{
    if (!message || [@"" isEqualToString:message]) {
        return;
    }
    MBProgressHUD *hud = [self initMBProgressHUD:message];
    hud.mode = MBProgressHUDModeCustomView;
    
    NSBundle *bundle = [NSBundle bundleForClass:[MBProgressHUD class]];
    NSURL *url = [bundle URLForResource:@"MBProgressHUD" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    
    UIImage *failedImage = [[UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"error" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *successImage = [[UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"success" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    if (isSuccess) {
        hud.customView = [[UIImageView alloc] initWithImage:successImage];
    }
    else{
        hud.customView = [[UIImageView alloc] initWithImage:failedImage];
    }
    
    [hud hideAnimated:YES afterDelay:AfterDelay];
}

#pragma - mark 显示自定文字加载框
+ (void)showHUDLoadingView:(NSString *)message {
    MBProgressHUD *hud = [self initMBProgressHUD:message];
    hud.minSize = CGSizeMake(100, 0);
    hud.mode = MBProgressHUDModeIndeterminate;
}

#pragma - mark 显示加载框
+ (void)showHUDLoadingView {
    [self showHUDMessage:@"正在加载"];
}

#pragma - mark 隐藏加载框
+ (void)stopHUDLoadingView {
    [self hideHUDForView:[[UIApplication sharedApplication].windows lastObject] animated:YES];
}

+ (MBProgressHUD *)initMBProgressHUD:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:(UIView *)[[UIApplication sharedApplication].windows lastObject] animated:YES];
    hud.label.text = message;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.contentColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

@end
