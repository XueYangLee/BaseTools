//
//  UIViewController+Current.h
//  QQSK-Test
//
//  Created by Singularity on 2018/11/22.
//  Copyright © 2018 李雪阳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Current)

/** 获取当前屏幕显示的viewcontroller */
+ (UIViewController *)currentViewController;

@end

NS_ASSUME_NONNULL_END
