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

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WKWebViewController *web=[WKWebViewController new];
//    NaviRoutePushToVC(web, YES);
    NaviRoutePushToNewVCRemoveVC(web, self, YES);
    
}

@end
