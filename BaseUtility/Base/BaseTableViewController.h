//
//  BaseTableViewController.h
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) UITableViewStyle tableViewStyle;

@property (nonatomic, strong) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
