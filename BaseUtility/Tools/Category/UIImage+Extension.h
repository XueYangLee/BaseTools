//
//  UIImage+Extension.h
//  CarSteward
//
//  Created by 李雪阳 on 2018/3/26.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  返回拉伸图片
 */
+ (UIImage *)resizedImage:(NSString *)name;
/**
 *  用颜色返回一张图片
 */
+ (UIImage *)imageWithColor:(UIColor*)color Alpha:(CGFloat)alpha;
/**
 *  带边框的图片
 *
 *  @param name        图片
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


/**
 *  使用图像名创建图像视图
 *
 *  @param imageName 图像名称
 *
 *  @return UIImageView
 */
+ (instancetype)imageViewWithImageName:(NSString *)imageName;

/**
 * 圆形图片
 */
- (UIImage *)circleImage;



/**
 根据View转成UIImage

 @param view 需要转成image的view
 */
+ (UIImage *)imageCreateFromView:(UIView *)view;



/**
 *  获取屏幕截图
 *
 *  @return 屏幕截图图像
 */
+ (UIImage *)screenShot;


@end
