//
//  BaseViewModel.h
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 带数据VMComp

 @param data 数据
 @param msg 信息
 */
typedef void (^VMDataCompletion) (id data, NSString *msg);


/**
 带数据及分页结果判定VMComp

 @param data 数据
 @param msg 信息
 @param noMoreData 有无更多数据
 */
typedef void (^VMDataRefreshCompletion) (id data, NSString *msg, BOOL noMoreData);

@interface BaseViewModel : NSObject

@end

NS_ASSUME_NONNULL_END
