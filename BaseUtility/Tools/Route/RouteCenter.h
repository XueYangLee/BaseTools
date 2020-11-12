//
//  RouteCenter.h
//  BaseTools
//
//  Created by 李雪阳 on 2020/10/27.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RouteCenter : NSObject

/**
 路由跳转
 @param URLString 路由地址
 @return 是否可以跳转
 */
+ (BOOL)jumpWithURL:(NSString *)URLString;

@end

NS_ASSUME_NONNULL_END
