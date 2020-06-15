//
//  TableViewController.m
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "TableViewController.h"
#import "WKWebViewController.h"

@interface TableViewController ()

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,assign) BOOL isEnd;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray=[NSMutableArray arrayWithArray:@[@"1111",@"222",@"333"]];
    [self setData];
    self.showRefreshHeader=YES;
    self.showRefreshFooter=YES;
    [self beginRefreshing];
}

- (void)setData{
    [self endRefreshData];
    if (!self.isEnd && self.pages!=0) {
        [self.dataArray addObjectsFromArray:@[@"1",@"2",@"3"]];
        if (self.dataArray.count!=3) {
            self.isEnd=YES;
        }else{
            self.isEnd=NO;
        }
        
//        [self noMoreData];
    }
    [self.tableView reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WKWebViewController *web=[WKWebViewController new];
//    NaviRoutePushToVC(web, YES);
    NaviRoutePushToNewVCRemoveVC(web, self, YES);
    
}

@end
