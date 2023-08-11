//
//  HealthStoreManager.h
//  NowMeditation
//
//  Created by Singularity on 2020/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HealthStoreDataType) {
    /// 身高
    HealthStoreDataTypeHeight,
    /// 体重
    HealthStoreDataTypeBodyMass,
    /// 体温
    HealthStoreDataTypeBodyTemperature,
    /// 活动能量
    HealthStoreDataTypeActiveEnergyBurned,
    /// 步数
    HealthStoreDataTypeStepCount,
    /// 步行+跑步距离
    HealthStoreDataTypeDistanceWalkingRunning,
    /// 心率
    HealthStoreDataTypeHeartRate,
    /// 收缩压
    HealthStoreDataTypeBloodPressureSystolic,
    /// 舒张压
    HealthStoreDataTypeBloodPressureDiastolic,
    /// 血氧饱和度
    HealthStoreDataTypeOxygenSaturation,
    /// 血糖
    HealthStoreDataTypeBloodGlucose,
    /// 总脂肪
    HealthStoreDataTypeDietaryFatTotal,
};

@class HealthStoreDataModel;

@interface HealthStoreManager : NSObject

/** 健康权限 */
+ (void)healthAuthorizationEnabled:(void (^)(BOOL enabled))comp;

/** 获取权限提醒弹窗 */
+ (void)authorizeRemind;


//MARK: - 读取

//MARK: - 数量样本(HKQuantityType)
/// 读取健康数据（数量样本）  当天
+ (void)readHealthQuantityTodayDataWithQuantityType:(HealthStoreDataType)quantityType comp:(void(^__nullable)(HealthStoreDataModel *healthData))comp;
/// 读取健康数据（数量样本）  指定日期一天的数据
+ (void)readHealthQuantityDataWithQuantityType:(HealthStoreDataType)quantityType date:(NSDate *)date comp:(void(^__nullable)(HealthStoreDataModel *healthData))comp;
/// 读取健康数据（数量样本）  指定时间段
+ (void)readHealthQuantityDataWithQuantityType:(HealthStoreDataType)quantityType  startDate:(NSDate *)startDate endDate:(NSDate *)endDate comp:(void(^__nullable)(HealthStoreDataModel *healthData))comp;

/// 读取当天每个小时段的健康数据（数量样本）
+ (void)readHealthPeriodTimeQuantityTodayDataWithQuantityType:(HealthStoreDataType)quantityType comp:(void(^__nullable)(NSArray <HealthStoreDataModel *>*healthDatas))comp;
/// 读取指定日期一天每个小时段的健康数据（数量样本）
+ (void)readHealthPeriodTimeQuantityDataWithQuantityType:(HealthStoreDataType)quantityType date:(NSDate *)date comp:(void(^__nullable)(NSArray <HealthStoreDataModel *>*healthDatas))comp;


//MARK: - 写入

/// 写入健康数据  当天 开始时间跟结束时间传一样
+ (void)writeHealthQuantityDataWithQuantityType:(HealthStoreDataType)quantityType value:(CGFloat)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate comp:(void(^__nullable)(BOOL success))comp;

@end





@interface HealthStoreDataModel : NSObject

/// 筛选数据的开始时间
@property (nonatomic,strong) NSDate *sortStartDate;
/// 筛选数据的结束时间
@property (nonatomic,strong) NSDate *sortEndDate;

/// 值
@property (nonatomic,assign) double value;
/// 记录值（最新）的开始时间
@property (nonatomic,strong) NSDate *startDate;
/// 记录值（最新）的结束时间
@property (nonatomic,strong) NSDate *endDate;

@property (nonatomic,assign) HealthStoreDataType quantityType;
/// 单位描述
@property (nonatomic,copy) NSString *unitDesc;

@end



NS_ASSUME_NONNULL_END
