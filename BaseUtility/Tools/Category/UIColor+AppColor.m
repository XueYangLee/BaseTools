//
//  UIColor+AppColor.m
//  BaseTools
//
//  Created by Singularity on 2020/10/27.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "UIColor+AppColor.h"

@implementation UIColor (AppColor)

+ (UIColor *)app_mainColor{
    return [UIColor colorWithHexString:@"#193F50"];
}

+ (UIColor *)app_titleColor{
    return [UIColor colorWithHexString:@"#444444"];
}

+ (UIColor *)app_subTitleColor{
    return [UIColor colorWithHexString:@"#8C8D96"];
}

+ (UIColor *)app_btnMainColor{
    return [UIColor colorWithHexString:@"#1E5063"];
}

+ (UIColor *)app_alertColor{
    return [UIColor colorWithHexString:@"#E74D45"];
}

@end
