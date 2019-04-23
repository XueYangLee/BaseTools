//
//  UIImage+ImageSize.h
//  BaseTools
//
//  Created by Singularity on 2019/4/23.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ImageSize)


/**
 获取网络图片尺寸

 @param imageURL 图片网址
 @return 返回的尺寸
 */
+ (CGSize)imageSizeWithImageUrl:(id)imageURL;

@end

NS_ASSUME_NONNULL_END
