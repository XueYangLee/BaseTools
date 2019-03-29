//
//  UIScreen+Extension.m
//  textPod
//
//  Created by 李雪阳 on 2017/11/21.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import "UIScreen+Extension.h"

@implementation UIScreen (Extension)

+ (CGSize)scrn_screenSize {
    return [UIScreen mainScreen].bounds.size;
}

+ (BOOL)scrn_isRetina {
    return [UIScreen scrn_scale] >= 2;
}

+ (CGFloat)scrn_scale {//屏幕分辨率
    return [UIScreen mainScreen].scale;
}

@end
