//
//  BaseViewModel.h
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 带有数据及信息文案返回 */
typedef void(^VMDataCompletion)(BOOL success, id data, NSString *msg);

/** 仅带有信息文案返回 */
typedef void(^VMMsgCompletion)(BOOL success, NSString *msg);

/** 带有数据、信息文案及刷新数据结果（有无更多数据）返回 */
typedef void(^VMDataRefreshCompletion)(BOOL success, id data, NSString *msg, BOOL noMoreData);

/** 仅带有信息文案及刷新数据结果（有无更多数据）返回 */
typedef void(^VMMsgRefreshCompletion)(BOOL success, NSString *msg, BOOL noMoreData);




@interface BaseViewModel : NSObject

@end

NS_ASSUME_NONNULL_END
