//
//  UIImage+Extension.h
//  CarSteward
//
//  Created by 李雪阳 on 2018/3/26.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/** 返回拉伸图片 */
+ (UIImage *)resizedImage:(NSString *)name;

/** 用颜色返回一张图片 */
+ (UIImage *)imageWithColor:(UIColor*)color Alpha:(CGFloat)alpha;

/** 带边框的图片 */
+ (instancetype)circleImageWithImageName:(NSString *)imageName borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/** 使用图像名创建图像视图 */
+ (instancetype)imageViewWithImageName:(NSString *)imageName;

/** 圆形图片 */
- (UIImage *)circleImage;

/** 根据View转成UIImage */
+ (UIImage *)imageCreateFromView:(UIView *)view;

/** 获取屏幕截图 */
+ (UIImage *)screenShot;

/** 获取启动图 */
+ (UIImage *)getLaunchImage;

/** 获取视频首帧图 */
+ (UIImage*)getVideoFirstFPSImage:(NSURL *)videoUrl;


@end
