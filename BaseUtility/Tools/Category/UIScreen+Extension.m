//
//  UIScreen+Extension.m
//  textPod
//
//  Created by 李雪阳 on 2017/11/21.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import "UIScreen+Extension.h"

@implementation UIScreen (Extension)

+ (CGSize)scrnSize {
    return [UIScreen mainScreen].bounds.size;
}

+ (BOOL)isRetinaScrn {
    return [UIScreen scrnScale] >= 2;
}

+ (CGFloat)scrnScale {//屏幕分辨率
    return [UIScreen mainScreen].scale;
}

@end
