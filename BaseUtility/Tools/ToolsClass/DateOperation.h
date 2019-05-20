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
 
 @param isShowExact 是返回详细到时分秒 否返回年月日
 */
+ (NSString *)currentTimeIsShowExactTime:(BOOL)isShowExact;



/**
 从开始时间的时间戳获取与目标时间（nil则为当前时间）的时间差

 @param fromTimeStamp 开始时间的时间戳
 @param toTimeStamp 结束时间的时间戳 传nil默认为当前时间
 @param comp 返回的时间
 */
+ (void)intervalTimeFromTimeStamp:(NSString *)fromTimeStamp ToTimeStamp:(NSString *)toTimeStamp Completion:(void(^)(NSString *year, NSString *month, NSString *day, NSString *hour, NSString *minute, NSString *second))comp;




/**
 获取从时间的时间戳到目标时间（nil则为当前时间）相隔的时分秒

 @param fromTimeStamp 开始时间的时间戳
 @param toTimeStamp 结束时间的时间戳 传nil默认为当前时间
 @return 时分秒
 */
+ (NSString *)intervalTimeWithHMSFromTimeStamp:(NSString *)fromTimeStamp ToTimeStamp:(NSString *)toTimeStamp;




/**
 仅获取从时间的时间戳到目标时间（nil则为当前时间）相隔的分秒

 @param fromTimeStamp 开始时间的时间戳
 @param toTimeStamp 结束时间的时间戳 传nil默认为当前时间
 @return 分秒
 */
+ (NSString *)intervalTimeWithMinuteSecFromTimeStamp:(NSString *)fromTimeStamp ToTimeStamp:(NSString *)toTimeStamp;




/**
 秒数倒计时 验证码获取
 
 @param maxSec 最大秒数
 @param comp isReturnZero 倒计时是否归零   countdownSec 倒计时每秒的秒数
 */
+ (void)countdownSecWithMaxSec:(int)maxSec Completion:(void (^)(BOOL isReturnZero, NSString *countdownSec))comp;




/**
 时间倒计时 活动开始时间到结束时间（nil则为当前时间）的倒计时

 @param startTimeStamp 开始时间的时间戳
 @param endTimeStamp 结束时间的时间戳 传nil默认为当前时间
 @param comp 返回的时间
 */
+ (void)countdownTimeWithStartTimeStamp:(NSString *)startTimeStamp EndTimeStamp:(NSString *)endTimeStamp Completion:(void (^)(BOOL isReturnZero, NSString *day, NSString *hour, NSString *minute, NSString *second))comp;






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
