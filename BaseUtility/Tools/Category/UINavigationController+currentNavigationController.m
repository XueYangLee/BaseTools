//
//  UINavigationController+currentNavigationController.m
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "UINavigationController+currentNavigationController.h"

@implementation UINavigationController (currentNavigationController)

+ (UINavigationController *)currentNavigationController{
    if ([UIViewController currentViewController].navigationController) {
        return [UIViewController currentViewController].navigationController;
    }else if ([self navigationControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController]) {
        return [self navigationControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }else {
        for (UIWindow *window in [UIApplication sharedApplication].windows) {
            if ([self navigationControllerWithRootViewController:window.rootViewController]) {
                return [self navigationControllerWithRootViewController:window.rootViewController];
            }
        }
    }
    return nil;
}



+ (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)rootViewController {
    if (rootViewController.presentedViewController) {
        UINavigationController *nav = [self navigationControllerWithRootViewController:rootViewController.presentedViewController];
        if (nav) {
            return nav;
        }
    }
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        UINavigationController *nav = [self navigationControllerWithRootViewController:tabBarController.selectedViewController];
        if (nav) {
            return nav;
        }
    }
    
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController*)rootViewController;
    }
    
    return rootViewController.navigationController;
}



@end
