//
//  PageJump.m
//  BaseTools
//
//  Created by 李雪阳 on 2020/10/27.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "PageJump.h"
#import "BaseWebViewController.h"

@implementation PageJump

// MARK: - URLJump
+ (void)jumpToWebWithURL:(NSString *)URLString{
    BaseWebViewController *web=[BaseWebViewController new];
    web.URLString=URLString;
    NaviRoutePushToVC(web, YES);
}

+ (void)jumpToWebWithURL:(NSString *)URLString title:(NSString *)title{
    BaseWebViewController *web=[BaseWebViewController new];
    web.URLString=URLString;
    web.title=title;
    NaviRoutePushToVC(web, YES);
}

// MARK: - pageJump
+ (void)jumpToHomeTab {
    
    if (![[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UITabBarController class]]) {
        return;
    }
    
    UITabBarController *tabbarController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if (tabbarController.selectedIndex == 0) {
        [[UIViewController currentViewController].navigationController popToRootViewControllerAnimated:YES];
    }else {
        [[UIViewController currentViewController].navigationController popToRootViewControllerAnimated:NO];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            tabbarController.selectedIndex = 0;
        });
        
    }
}


+ (void)jumpToLogin{
    
}

@end
