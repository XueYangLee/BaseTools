//
//  LXYQRCodeUtility.h
//  PartScan
//
//  Created by 李雪阳 on 2017/12/12.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_FRAME [UIScreen mainScreen].bounds
#define kIOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending)

static const float kLineMinY = 181;
static const float kLineMaxY = 440;
static const float kReaderViewWidth = 259;
static const float kReaderViewHeight = 259;

@interface LXYQRCodeUtility : NSObject

+ (BOOL)canAccessAVCaptureDeviceForMediaType:(NSString *)mediaType;
+ (NSString *)readQRCodeImage:(UIImage *)imagePicked;
+ (UIImage *)generateQRCodeImage:(NSString *)strQRCode
                            size:(CGSize)size;

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message;
+ (CGRect)getReaderViewBoundsWithSize:(CGSize)asize;
+ (CAKeyframeAnimation *)zoomOutAnimation;
+ (void)openSystemSettings;

@end
