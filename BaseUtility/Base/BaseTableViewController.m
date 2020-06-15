//
//  BaseTableViewController.m
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController


- (instancetype)init {
    self = [super init];
    if (self) {
        self.tableViewStyle = UITableViewStyleGrouped;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initTableView];
    [self initRefreshControl];
    
    [self.tableView.mj_header setHidden:!self.showRefreshHeader];
    [self.tableView.mj_footer setHidden:!self.showRefreshFooter];
}

- (void)initTableView{
    [self.tableView removeFromSuperview];
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WINDOW_HEIGHT) style:self.tableViewStyle];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.showsVerticalScrollIndicator=NO;
    tableView.showsHorizontalScrollIndicator=NO;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    tableView.sectionFooterHeight = 0;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.delegate=self;
    tableView.dataSource=self;
    if (@available(iOS 11.0, *)) {
        if ([self respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]){
            tableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        }
    } else {
        if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    [self.view addSubview:tableView];
    
    _tableView=tableView;
}


- (void)setTableViewStyle:(UITableViewStyle)tableViewStyle{
    _tableViewStyle=tableViewStyle;
    
    if (self.tableView) {
        [self initTableView];
    }
}


- (void)initRefreshControl{
    WS(weakSelf)
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.pages = 0;
        [weakSelf setData];
    }];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.mj_header=header;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        weakSelf.pages++;
        [weakSelf setData];
    }];
    [footer setTitle:@"没有更多数据了" forState:MJRefreshStateNoMoreData];
    self.tableView.mj_footer=footer;
}


#pragma mark - tableView delegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * const identifier = @"baseTableViewCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text=@"如果此内容存在，需配置tableView代理";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001f;
}


#pragma mark - refresh
- (void)setShowRefreshHeader:(BOOL)showRefreshHeader{
    _showRefreshHeader=showRefreshHeader;
    [self.tableView.mj_header setHidden:!self.showRefreshHeader];
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter{
    _showRefreshFooter=showRefreshFooter;
    [self.tableView.mj_footer setHidden:!self.showRefreshFooter];
}

#pragma mark - data refresh protocol
- (void)setData{
    
}

- (void)endRefreshInHeader{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer setHidden:NO];
        self.tableView.mj_footer.state = MJRefreshStateIdle;
    });
    [self.tableView.mj_header endRefreshing];
}

- (void)endRefreshInFooter{
    [self.tableView.mj_footer endRefreshing];
}

- (void)endRefreshData{
    [self endRefreshInHeader];
    [self endRefreshInFooter];
}


- (void)beginRefreshing{
    if (self.showRefreshFooter) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.mj_footer setHidden:YES];
        });
    }
    [self.tableView.mj_header beginRefreshing];
}


/*
 * 是否允许多个手势识别器共同识别，一个控件的手势识别后是否阻断手势识别继续向下传播，默认返回NO；如果为YES，响应者链上层对象触发手势识别后，如果下层对象也添加了手势并成功识别也会继续执行，否则上层对象识别后则不再继续传播
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}


@end
