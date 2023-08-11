//
//  HealthStoreManager.m
//  NowMeditation
//
//  Created by Singularity on 2020/12/21.
//

#import "HealthStoreManager.h"
#import <HealthKit/HealthKit.h>

@implementation HealthStoreManager

//MARK: 通知权限判断
+ (void)healthAuthorizationEnabled:(void (^)(BOOL enabled))comp{
    if ([HKHealthStore isHealthDataAvailable]) {
        
        HKHealthStore *healthStore = [[HKHealthStore alloc]init];
        [healthStore requestAuthorizationToShareTypes:nil readTypes:[self dataTypesToRead] completion:^(BOOL success, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (comp) {
                    comp(success);
                }
            });
        }];
    }else{
        if (comp) {
            comp(NO);
        }
    }
}


/// 写入权限集合
+ (NSSet *)dataTypesToWrite
{
    HKQuantityType *heightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];//身高
    HKQuantityType *weightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];//体重
    HKQuantityType *temperatureType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];//体温
    HKQuantityType *activeEnergyType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];//活动能量
    
    return [NSSet setWithObjects:
            heightType,
            temperatureType,
            weightType,
            activeEnergyType,
            nil];
}

/// 读取权限集合
+ (NSSet *)dataTypesToRead
{
    HKQuantityType *heightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];//身高
    HKQuantityType *weightType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];//体重
    HKQuantityType *stepCountType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];//步数
    HKQuantityType *distanceType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];//步行+跑步距离
    HKQuantityType *activeEnergyType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];////活动能量
    HKQuantityType *temperatureType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];//体温
    HKQuantityType *heartRateType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];//心率
    HKQuantityType *bloodPressureSystolicType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic];//收缩压
    HKQuantityType *bloodPressureDiastolicType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic];//舒张压
    HKQuantityType *oxygenSaturationType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierOxygenSaturation];//血氧饱和度
    HKQuantityType *bloodGlucoseTypeType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose];//血糖
    HKQuantityType *dietaryFatTotalType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal];//总脂肪
    
    return [NSSet setWithObjects:
            stepCountType,
//            heightType,
//            weightType,
//            distanceType,
            heartRateType,
//            activeEnergyType,
//            temperatureType,
            bloodPressureSystolicType,
            bloodPressureDiastolicType,
            oxygenSaturationType,
//            bloodGlucoseTypeType,
//            dietaryFatTotalType,
            nil];
}

//MARK: 权限提示
+ (void)authorizeRemind{
    
    [CustomAlert showAlertAddTarget:[UIViewController currentViewController] title:nil message:[NSString stringWithFormat:@"请在健康APP - 浏览 - 您需要记录或读取的健康类别 - [底部]数据源与访问权限中开启%@的读取权限以获取健康信息",APP_NAME] cancelBtnTitle:@"取消" defaultBtnTitle:@"去开启" actionHandle:^(NSInteger actionIndex, NSString * _Nonnull btnTitle) {
        if (actionIndex==1) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"x-apple-health://app/"] options:@{} completionHandler:nil];
        }
    }];
    
}

//MARK: - 读取

//MARK: - 数量样本(HKQuantityType)
+ (void)readHealthQuantityTodayDataWithQuantityType:(HealthStoreDataType)quantityType comp:(void(^__nullable)(HealthStoreDataModel *healthData))comp{
    
    NSDate *nowDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    [self readHealthQuantityDataWithQuantityType:quantityType date:nowDate comp:comp];
}

+ (void)readHealthQuantityDataWithQuantityType:(HealthStoreDataType)quantityType date:(NSDate *)date comp:(void(^__nullable)(HealthStoreDataModel *healthData))comp{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *startDate = [self handleGetDateWithCaledar:calendar nowDate:date hour:0 minute:0 second:0];
    NSDate *endDate = [self handleGetDateWithCaledar:calendar nowDate:date hour:23 minute:59 second:59];
    [self readHealthQuantityDataWithQuantityType:quantityType startDate:startDate endDate:endDate comp:comp];
}

+ (void)readHealthQuantityDataWithQuantityType:(HealthStoreDataType)quantityType  startDate:(NSDate *)startDate endDate:(NSDate *)endDate comp:(void(^__nullable)(HealthStoreDataModel *healthData))comp{
    
    HKHealthStore *healthStore = [[HKHealthStore alloc]init];
    HKSampleType *sampleType = [HKSampleType quantityTypeForIdentifier:[self HKQuantityTypeIdentifierWithQuantityType:quantityType]];
        
    NSSortDescriptor *startSortDec = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *endSortDec = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    
    HealthStoreDataModel *model = [HealthStoreDataModel new];
    model.quantityType=quantityType;
    model.sortStartDate=startDate;
    model.sortEndDate=endDate;
    
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionNone]; // 筛选当天的数据
    HKSampleQuery *hkSQ = [[HKSampleQuery alloc] initWithSampleType:sampleType predicate:predicate limit:HKObjectQueryNoLimit sortDescriptors:@[startSortDec, endSortDec] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        DLog(@"healthValue:%@ \nresults:%@ \nerror:%@", query, results, error);
        
        CGFloat healthDataValue = 0;
        for (HKQuantitySample *sampM in results) {
            NSInteger isUserWrite = [sampM.metadata[HKMetadataKeyWasUserEntered] integerValue];
            if (isUserWrite == 1 && quantityType == HealthStoreDataTypeStepCount) { // 用户手动录入的数据。计算步数下不取
                continue;
            }
            
            double values = [sampM.quantity doubleValueForUnit:[self HKUnitWithQuantityType:quantityType]];
            
            if (quantityType == HealthStoreDataTypeStepCount || quantityType == HealthStoreDataTypeDistanceWalkingRunning) {
                healthDataValue += values;
            }else{
                healthDataValue = values;
                break;
            }
            
        }
//        DLog(@"获取健康数据数值:%f", healthDataValue);
        model.value=healthDataValue;
        model.startDate=results.firstObject.startDate;
        model.endDate=results.firstObject.endDate;
        
        if (comp) {
            comp(model);
        }
    }];
    [healthStore executeQuery:hkSQ];
}




+ (void)readHealthPeriodTimeQuantityTodayDataWithQuantityType:(HealthStoreDataType)quantityType comp:(void(^__nullable)(NSArray <HealthStoreDataModel *>*healthDatas))comp{
    NSDate *nowDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    [self readHealthPeriodTimeQuantityDataWithQuantityType:quantityType date:nowDate comp:comp];
}


+ (void)readHealthPeriodTimeQuantityDataWithQuantityType:(HealthStoreDataType)quantityType date:(NSDate *)date comp:(void(^__nullable)(NSArray <HealthStoreDataModel *>*healthDatas))comp{
    
    HKHealthStore *healthStore = [[HKHealthStore alloc]init];
    HKSampleType *sampleType = [HKSampleType quantityTypeForIdentifier:[self HKQuantityTypeIdentifierWithQuantityType:quantityType]];
        
    NSMutableArray <HealthStoreDataModel *>*array=[NSMutableArray array];
    for (NSInteger i=0; i<24; i++) {
        NSSortDescriptor *startSortDec = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
        NSSortDescriptor *endSortDec = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        NSDate *startDate = [self handleGetDateWithCaledar:calendar nowDate:date hour:i minute:0 second:0];
        NSDate *endDate = [self handleGetDateWithCaledar:calendar nowDate:date hour:i minute:59 second:59];
        
        HealthStoreDataModel *model = [HealthStoreDataModel new];
        model.quantityType=quantityType;
        model.sortStartDate=startDate;
        model.sortEndDate=endDate;
        
        NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionNone]; // 筛选当天的数据
        HKSampleQuery *hkSQ = [[HKSampleQuery alloc] initWithSampleType:sampleType predicate:predicate limit:HKObjectQueryNoLimit sortDescriptors:@[startSortDec, endSortDec] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
//            DLog(@"healthValue:%@ \nresults:%@ \nerror:%@", query, results, error);
            
            CGFloat healthDataValue = 0;
            for (HKQuantitySample *sampM in results) {
                NSInteger isUserWrite = [sampM.metadata[HKMetadataKeyWasUserEntered] integerValue];
                if (isUserWrite == 1 && quantityType == HealthStoreDataTypeStepCount) { // 用户手动录入的数据。计算步数下不取
                    continue;
                }
                
                double values = [sampM.quantity doubleValueForUnit:[self HKUnitWithQuantityType:quantityType]];
                
                if (quantityType == HealthStoreDataTypeStepCount || quantityType == HealthStoreDataTypeDistanceWalkingRunning) {
                    healthDataValue += values;
                }else{
                    healthDataValue = values;
                    break;
                }
                
            }
//            DLog(@"获取健康数据数值:%f", healthDataValue);
            model.value=healthDataValue;
            model.startDate=results.firstObject.startDate;
            model.endDate=results.firstObject.endDate;
            [array addObject:model];
            
            if (i == 23) {
                if (comp) {
                    comp(array);
                }
            }
            
        }];
        [healthStore executeQuery:hkSQ];
    }
}



//MARK: - 写入

//MARK: - 数量样本(HKQuantityType)
//写入数据之前，注意要先申请写入权限
+ (void)writeHealthQuantityDataWithQuantityType:(HealthStoreDataType)quantityType value:(CGFloat)value startDate:(NSDate *)startDate endDate:(NSDate *)endDate comp:(void(^__nullable)(BOOL success))comp{
    if ([HKHealthStore isHealthDataAvailable]){
        
        HKHealthStore *healthStore = [[HKHealthStore alloc]init];
        
        //create sample
        HKQuantityType *sampleType = [HKQuantityType quantityTypeForIdentifier:[self HKQuantityTypeIdentifierWithQuantityType:quantityType]];
        HKQuantity *quantity = [HKQuantity quantityWithUnit:[self HKUnitWithQuantityType:quantityType] doubleValue:value];
        
        //sample date
        NSDate *today = [NSDate date];
        
        //create sample
        HKQuantitySample *sample = [HKQuantitySample quantitySampleWithType:sampleType quantity:quantity startDate:startDate endDate:endDate];
            
        //save objects to health kit
        [healthStore saveObject:sample withCompletion:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                DLog(@"保存成功");
            }else{
                DLog(@"保存失败");
            }
            if (comp) {
                comp(success);
            }
        }];
    }
}



//MARK: - function

/*
 HKQuantityTypeIdentifierHeight  身高
 HKQuantityTypeIdentifierBodyMass  体重
 HKQuantityTypeIdentifierBodyTemperature  体温
 HKQuantityTypeIdentifierActiveEnergyBurned  活动能量
 HKQuantityTypeIdentifierStepCount  步数
 HKQuantityTypeIdentifierDistanceWalkingRunning  步行+跑步距离
 HKQuantityTypeIdentifierHeartRate  心率
 HKQuantityTypeIdentifierBloodPressureSystolic  收缩压
 HKQuantityTypeIdentifierBloodPressureDiastolic  舒张压
 HKQuantityTypeIdentifierOxygenSaturation  血氧饱和度
 HKQuantityTypeIdentifierBloodGlucose  血糖
 HKQuantityTypeIdentifierDietaryFatTotal  总脂肪
 HKCategoryTypeIdentifierMindfulSession  冥想
 HKCategoryTypeIdentifierSleepAnalysis  睡眠分析
*/

+ (HKQuantityTypeIdentifier)HKQuantityTypeIdentifierWithQuantityType:(HealthStoreDataType)quantityType{
    
    HKQuantityTypeIdentifier identifier = HKQuantityTypeIdentifierStepCount;
    
    if (quantityType == HealthStoreDataTypeHeight) {// 身高
        identifier = HKQuantityTypeIdentifierHeight;
    }else if (quantityType == HealthStoreDataTypeBodyMass){// 体重
        identifier = HKQuantityTypeIdentifierBodyMass;
    }else if (quantityType == HealthStoreDataTypeBodyTemperature){// 体温
        identifier = HKQuantityTypeIdentifierBodyTemperature;
    }else if (quantityType == HealthStoreDataTypeActiveEnergyBurned){// 活动能量
        identifier = HKQuantityTypeIdentifierActiveEnergyBurned;
    }else if (quantityType == HealthStoreDataTypeStepCount){// 步数
        identifier = HKQuantityTypeIdentifierStepCount;
    }else if (quantityType == HealthStoreDataTypeDistanceWalkingRunning){// 步行+跑步距离
        identifier = HKQuantityTypeIdentifierDistanceWalkingRunning;
    }else if (quantityType == HealthStoreDataTypeHeartRate){// 心率
        identifier = HKQuantityTypeIdentifierHeartRate;
    }else if (quantityType == HealthStoreDataTypeBloodPressureSystolic){// 收缩压
        identifier = HKQuantityTypeIdentifierBloodPressureSystolic;
    }else if (quantityType == HealthStoreDataTypeBloodPressureDiastolic){// 舒张压
        identifier = HKQuantityTypeIdentifierBloodPressureDiastolic;
    }else if (quantityType == HealthStoreDataTypeOxygenSaturation){// 血氧饱和度
        identifier = HKQuantityTypeIdentifierOxygenSaturation;
    }else if (quantityType == HealthStoreDataTypeBloodGlucose){// 血糖
        identifier = HKQuantityTypeIdentifierBloodGlucose;
    }else if (quantityType == HealthStoreDataTypeDietaryFatTotal){// 总脂肪
        identifier = HKQuantityTypeIdentifierDietaryFatTotal;
    }
    
    return identifier;
}

/// HKUnit
+ (HKUnit *)HKUnitWithQuantityType:(HealthStoreDataType)quantityType{
    
    HKUnit *unit = [HKUnit countUnit];
    
    if (quantityType == HealthStoreDataTypeHeight) {// 身高
        unit = [HKUnit meterUnitWithMetricPrefix:HKMetricPrefixCenti];//cm
    }else if (quantityType == HealthStoreDataTypeBodyMass){// 体重
        unit = [HKUnit gramUnitWithMetricPrefix:HKMetricPrefixKilo];//kg
    }else if (quantityType == HealthStoreDataTypeBodyTemperature){// 体温
        unit = [HKUnit degreeCelsiusUnit];//℃
    }else if (quantityType == HealthStoreDataTypeActiveEnergyBurned){// 活动能量
        unit = [HKUnit kilocalorieUnit];//kcal
    }else if (quantityType == HealthStoreDataTypeStepCount){// 步数
        unit = [HKUnit countUnit];//count
    }else if (quantityType == HealthStoreDataTypeDistanceWalkingRunning){// 步行+跑步距离
        unit = [HKUnit meterUnit];//m
    }else if (quantityType == HealthStoreDataTypeHeartRate){// 心率
        unit = [HKUnit unitFromString:@"count/min"];//count/min
    }else if (quantityType == HealthStoreDataTypeBloodPressureSystolic){// 收缩压
        unit = [HKUnit millimeterOfMercuryUnit];//mmHg
    }else if (quantityType == HealthStoreDataTypeBloodPressureDiastolic){// 舒张压
        unit = [HKUnit millimeterOfMercuryUnit];//mmHg
    }else if (quantityType == HealthStoreDataTypeOxygenSaturation){// 血氧饱和度
        unit = [HKUnit percentUnit];//%
    }else if (quantityType == HealthStoreDataTypeBloodGlucose){// 血糖
        unit = [[HKUnit moleUnitWithMetricPrefix:HKMetricPrefixMilli molarMass:HKUnitMolarMassBloodGlucose] unitDividedByUnit:[HKUnit literUnit]];//mmol
//        unit = [HKUnit unitFromString:[NSString stringWithFormat:@"mmol<%f>/L",HKUnitMolarMassBloodGlucose]];//mmol
    }else if (quantityType == HealthStoreDataTypeDietaryFatTotal){// 总脂肪
        unit = [HKUnit gramUnit];//g
    }
    
    return unit;
}


+ (NSDate *)handleGetDateWithCaledar:(NSCalendar *)calendar nowDate:(NSDate *)nowDate hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    NSDateComponents *dateNowComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:nowDate];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dateNowComponents.day];
    [dateComponents setMonth:dateNowComponents.month];
    [dateComponents setYear:dateNowComponents.year];
    [dateComponents setHour:hour];
    [dateComponents setMinute:minute];
    [dateComponents setSecond:second];
    return [calendar dateFromComponents:dateComponents];
}

+ (NSPredicate *)predicateForSamplesToday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond: 0];
    
    NSDate *startDate = [calendar dateFromComponents:components];
    NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:startDate options:0];
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionNone];
    return predicate;
}

@end




@implementation HealthStoreDataModel

- (NSString *)unitDesc{
    NSString *unit = @"";
    
    if (self.quantityType == HealthStoreDataTypeHeight) {// 身高
        unit = @"cm";//cm
    }else if (self.quantityType == HealthStoreDataTypeBodyMass){// 体重
        unit = @"kg";//kg
    }else if (self.quantityType == HealthStoreDataTypeBodyTemperature){// 体温
        unit = @"℃";//℃
    }else if (self.quantityType == HealthStoreDataTypeActiveEnergyBurned){// 活动能量
        unit = @"kcal";//kcal
    }else if (self.quantityType == HealthStoreDataTypeStepCount){// 步数
        unit = @"count";//count
    }else if (self.quantityType == HealthStoreDataTypeDistanceWalkingRunning){// 步行+跑步距离
        unit = @"m";//m
    }else if (self.quantityType == HealthStoreDataTypeHeartRate){// 心率
        unit = @"count/min";//count/min
    }else if (self.quantityType == HealthStoreDataTypeBloodPressureSystolic){// 收缩压
        unit = @"mmHg";//mmHg
    }else if (self.quantityType == HealthStoreDataTypeBloodPressureDiastolic){// 舒张压
        unit = @"mmHg";//mmHg
    }else if (self.quantityType == HealthStoreDataTypeOxygenSaturation){// 血氧饱和度
        unit = @"%";//%
    }else if (self.quantityType == HealthStoreDataTypeBloodGlucose){// 血糖
        unit = @"mmol/L";//mmol
    }else if (self.quantityType == HealthStoreDataTypeDietaryFatTotal){// 总脂肪
        unit = @"g";//g
    }
    return unit;
}

@end

