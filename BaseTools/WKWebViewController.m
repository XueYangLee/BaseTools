//
//  WKWebViewController.m
//  BaseTools
//
//  Created by Singularity on 2019/4/4.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "WKWebViewController.h"

@interface WKWebViewController ()

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://qqzx.xc2018.com.cn/htdocs/h5/testBridge.html"]]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
