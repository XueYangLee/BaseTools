//
//  HomeViewController.m
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "HomeViewController.h"
#import "TableViewController.h"
#import "CollectionViewController.h"
#import "WKWebViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *table=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    table.backgroundColor=[UIColor blueColor];
    table.tag=10;
    [table addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:table];
    
    UIButton *collect=[[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    collect.backgroundColor=[UIColor yellowColor];
    collect.tag=11;
    [collect addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collect];
    
    UIButton *web=[[UIButton alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
    web.backgroundColor=[UIColor orangeColor];
    web.tag=12;
    [web addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:web];
}


- (void)btnClick:(UIButton *)sender{
    if (sender.tag==10) {
        TableViewController *table=[TableViewController new];
        NaviRoutePushToVC(table, YES);
        //    NaviRoutePresentToVC(table, YES);
        //    [[UIViewController currentViewController].navigationController pushViewController:table animated:YES];
    }else if (sender.tag==11){
        CollectionViewController *collect=[CollectionViewController new];
        NaviRoutePushToVC(collect, YES);
    }else if (sender.tag==12){
        WKWebViewController *web=[WKWebViewController new];
        NaviRoutePushToVC(web, YES);
    }
    
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
