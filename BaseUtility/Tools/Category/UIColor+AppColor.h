//
//  UIColor+AppColor.h
//  BaseTools
//
//  Created by Singularity on 2020/10/27.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (AppColor)

/** app主色调 */
+ (UIColor *)app_mainColor;
/** 主文字颜色 */
+ (UIColor *)app_titleColor;
/** 辅助文字颜色 */
+ (UIColor *)app_subTitleColor;
/** 按钮背景色 */
+ (UIColor *)app_btnMainColor;
/** 警告提示色 */
+ (UIColor *)app_alertColor;

@end

NS_ASSUME_NONNULL_END
