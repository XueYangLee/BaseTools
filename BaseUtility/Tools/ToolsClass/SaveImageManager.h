//
//  SaveImageManager.h
//  WeiGuGlobal
//
//  Created by Singularity on 2019/4/3.
//  Copyright © 2019 com.chuang.global. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SaveImageManager : NSObject


/**
 保存多张图片并创建APP相册到本地
 
 @param imageArray 图片数组
 */
+ (void)saveImages:(NSArray <NSString *>*)imageArray;



/**
 保存单张图片并创建APP相册到本地
 
 @param imageUrl 图片Url
 */
+ (void)saveImage:(NSString *)imageUrl;



/**
 保存单张图片并创建APP相册到本地 **通用方法**
 
 @param image 图片
 @param comp 回调
 */
+ (void)writeImage:(UIImage *)image Completion:(void (^__nullable)(BOOL success))comp;




/**
 SDWebImage下载多张图片
 
 @param imgsArray 图片数组Url
 @param comp 回调 返回image数组
 */
+ (void)downloadWebImages:(NSArray<NSString *> *)imgsArray completion:(void(^)(NSArray *imageArray))comp;

@end

NS_ASSUME_NONNULL_END
