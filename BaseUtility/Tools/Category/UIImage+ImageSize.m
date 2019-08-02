//
//  UIImage+ImageSize.m
//  BaseTools
//
//  Created by Singularity on 2019/4/23.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "UIImage+ImageSize.h"
#import <ImageIO/ImageIO.h>

@implementation UIImage (ImageSize)


// 根据图片url获取图片尺寸
+ (CGSize)imageSizeWithImageUrl:(id)imageURL {
    NSURL * URL = nil;
    if ([imageURL isKindOfClass:[NSURL class]]) {
        URL = imageURL;
    }
    if ([imageURL isKindOfClass:[NSString class]]) {
        URL = [NSURL URLWithString:imageURL];
    }
    if (!imageURL) {
        return CGSizeZero;
    }
    CGImageSourceRef imageSourceRef = CGImageSourceCreateWithURL((CFURLRef)URL, NULL);
    CGFloat width = 0, height = 0;
    
    if (imageSourceRef) {
        
        // 获取图像属性
        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, NULL);
        
        //以下是对手机32位、64位的处理
        if (imageProperties != NULL) {
            
            CFNumberRef widthNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
            
#if defined(__LP64__) && __LP64__
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat64Type, &width);
            }
            
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat64Type, &height);
            }
#else
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat32Type, &width);
            }
            
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat32Type, &height);
            }
#endif
            /********************** 此处解决返回图片宽高相反问题 **********************/
            // 图像旋转的方向属性
            NSInteger orientation = [(__bridge NSNumber *)CFDictionaryGetValue(imageProperties, kCGImagePropertyOrientation) integerValue];
            CGFloat temp = 0;
            switch (orientation) {
                case UIImageOrientationLeft: // 向左逆时针旋转90度
                case UIImageOrientationRight: // 向右顺时针旋转90度
                case UIImageOrientationLeftMirrored: // 在水平翻转之后向左逆时针旋转90度
                case UIImageOrientationRightMirrored: { // 在水平翻转之后向右顺时针旋转90度
                    temp = width;
                    width = height;
                    height = temp;
                }
                    break;
                default:
                    break;
            }
            /********************** 此处解决返回图片宽高相反问题 **********************/
            
            CFRelease(imageProperties);
        }
        CFRelease(imageSourceRef);
    }
    return CGSizeMake(width, height);
}


@end
