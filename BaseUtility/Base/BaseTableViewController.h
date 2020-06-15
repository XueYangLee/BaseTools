//
//  BaseTableViewController.h
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseDataRefreshProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,BaseDataRefreshProtocol>


@property (nonatomic, strong) UITableView *tableView;

/** 修改tableView的UITableViewStyle */
@property (nonatomic, assign) UITableViewStyle tableViewStyle;


/** 是否显示刷新控件刷新头（下拉刷新）  默认不显示 */
@property (nonatomic, assign) BOOL showRefreshHeader;

/** 是否显示刷新控件刷新尾（上拉加载）  默认不显示 */
@property (nonatomic, assign) BOOL showRefreshFooter;


/** 页码 */
@property (nonatomic, assign) NSInteger pages;


@end

NS_ASSUME_NONNULL_END
