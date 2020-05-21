//
//  UIColor+Extensions.h
//  BaseTools
//
//  Created by 李雪阳 on 2020/5/21.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extensions)

/** 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB) */
+ (UIColor *)colorWithHexString:(NSString *)color;


/** 暗黑及常规模式颜色适应 */
+ (UIColor *)colorWithDarkColor:(UIColor *)darkModeColor DefaultColor:(UIColor *)defaultModeColor;

@end

NS_ASSUME_NONNULL_END
