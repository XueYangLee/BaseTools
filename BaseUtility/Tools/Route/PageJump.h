//
//  PageJump.h
//  BaseTools
//
//  Created by 李雪阳 on 2020/10/27.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PageJump : NSObject

// MARK: - URLJump
/** 跳转到网页 */
+ (void)jumpToWebWithURL:(NSString *)URLString;

/** 跳转到网页 附加导航栏title */
+ (void)jumpToWebWithURL:(NSString *)URLString title:(NSString *)title;


// MARK: - pageJump
/** 跳转到首页 */
+ (void)jumpToHomeTab;

/** 登录页面 */
+ (void)jumpToLogin;

@end

NS_ASSUME_NONNULL_END
