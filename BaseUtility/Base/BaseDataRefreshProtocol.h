//
//  BaseDataRefreshProtocol.h
//  BaseTools
//
//  Created by 李雪阳 on 2020/6/15.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BaseDataRefreshProtocol <NSObject>

@optional

/** 数据源 */
- (void)setData;

/** 结束下拉刷新 下拉加载动作 */
- (void)endRefreshData;

/** 结束下拉刷新动作（刷新头） */
- (void)endRefreshInHeader;

/** 结束上拉加载动作（刷新尾）*/
- (void)endRefreshInFooter;

/** 没有更多数据 隐藏刷新尾部 */
- (void)noMoreData;

/** 开始刷新动作 */
- (void)beginRefreshing;

@end

NS_ASSUME_NONNULL_END
