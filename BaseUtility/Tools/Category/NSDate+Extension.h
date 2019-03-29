//
//  NSDate+Extension.h
//  textPod
//
//  Created by 李雪阳 on 2017/11/22.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)


/**
 日期描述

 @return
      -   刚刚(一分钟内)
      -   X分钟前(一小时内)
      -   X小时前(当天)
      -   昨天 HH:mm(昨天)
      -   MM-dd HH:mm(一年内)
      -   yyyy-MM-dd HH:mm(更早期)
 */
- (NSString *)dateDescription;



/**
 返回yyyy-MM-dd形式date

 */
- (NSDate *)dateWithYMD;



/**
 是否为今天
 */
- (BOOL)isToday;


/**
 是否为昨天
 */
- (BOOL)isYesterday;


/**
 是否为今年
 */
- (BOOL)isThisYear;



/**
 获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;



/**
 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;


@end
