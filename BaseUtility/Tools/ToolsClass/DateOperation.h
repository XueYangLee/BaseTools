//
//  DateOperation.h
//  textPod
//
//  Created by 李雪阳 on 2017/11/22.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateOperation : NSObject



/**
 转化自定义格式日期（yyyy-MM-dd）

 @param format yyyy 年  MM 月  dd 日
 @param date 日期
 */
+ (NSString *)convertDateWithFormat:(NSString *)format Date:(NSDate *)date;


/**
 时间戳转字符串时间
 
 @param timeStamp 时间戳
 @param showSecond 是否显示详细时间（是则返回时分秒）
 */
+ (NSString *)dateStringWithTimeStamp:(NSString *)timeStamp isShowExactTime:(BOOL)showSecond;


/**
 获取当前时间时间戳
 */
+ (NSString *)getCurrentTimeStamp;


/**
 获取当前时间
 
 @param isShow 是返回详细到时分秒 否返回年月日
 */
+ (NSString *)currentTimeIsYes:(BOOL)isShow;



/**
 从开始时间的时间戳获取与当前时间的时间差

 @param timeStamp 开始时间的时间戳
 @param comp 返回的时间
 */
+ (void)intervalTimeFromTimeStamp:(NSString *)timeStamp Completion:(void(^)(NSString *year,NSString *month,NSString *day,NSString *hour,NSString *minute,NSString *second))comp;



/**
 获取从时间的时间戳到当前时间相隔的时分秒

 @param timeStamp 开始时间的时间戳
 @return 时分秒
 */
+ (NSString *)intervalTimeWithHMSFromTimeStamp:(NSString *)timeStamp;



/**
 仅获取从时间的时间戳到当前时间相隔的分秒

 @param timeStamp 开始时间的时间戳
 @return 分秒
 */
+ (NSString *)intervalTimeWithMinuteSecFromTimeStamp:(NSString *)timeStamp;


/**
 获取日期组成
 */
+ (NSDateComponents *)getComponents;



/**
 判断是否是周末
 */
+ (BOOL)isWeekendDate:(NSDate *)date;


/**
 获取当前星期

 @param isText 返回数字表示还是文字表示
 */
+ (id)getCurrentWeekStringisNumberText:(BOOL)isText;


/**
 根据日期获取星期
 */
+ (NSString *)getWeekStringByDate:(NSDate *)date;


/**
 本年第一天至最后一天
 
 @param isFirstDate YES 第一天date    NO 最后一天date
 */
+ (NSDate *)getYearTimeIsFirstDate:(BOOL)isFirstDate;


/**
 本月第一天到最后一天
 
 @param isFirstDate YES 第一天date    NO 最后一天date
 */
+ (NSDate *)getMonthTimeIsFirstDate:(BOOL)isFirstDate;


/**
 本周周一到周末
 
 @param isFirstDate YES 周一date   NO 周末date
 */
+ (NSDate *)getWeekTimeIsFirthDate:(BOOL)isFirstDate;


#pragma mark

/**
 根据日期获取农历

 @param date 日期
 */
+ (NSString*)getChineseCalendarWithDate:(NSDate *)date;

@end
