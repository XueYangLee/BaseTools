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
    
    UIButton *alert=[[UIButton alloc]initWithFrame:CGRectMake(0, 300, 100, 100)];
    alert.backgroundColor=[UIColor redColor];
    alert.tag=13;
    [alert addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alert];
}


- (void)btnClick:(UIButton *)sender{
    if (sender.tag==10) {
        TableViewController *table=[TableViewController new];
        NaviRoutePushToVC(table, YES);
//            NaviRoutePresentToVC(table);
        //    [[UIViewController currentViewController].navigationController pushViewController:table animated:YES];
    }else if (sender.tag==11){
        CollectionViewController *collect=[CollectionViewController new];
        NaviRoutePushToVC(collect, YES);
        
//        [SVProgressHUD showWithStatus:@"保存中"];
//        [[DownloadVideo sharedDownloadVideo]videoDownloadWithUrl:@"https://file.wegoomall.cn/video/20190625/8033690822046423.mp4" Completion:^(BOOL success) {
//            [SVProgressHUD showSuccessWithStatus:success?@"成功啊啊啊":@"失败啦啦"];
//        }];
    }else if (sender.tag==12){
        WKWebViewController *web=[WKWebViewController new];
        NaviRoutePushToVC(web, YES);
        
//        [SVProgressHUD showWithStatus:@"保存中"];
//        [[SaveImageManager sharedSaveImage]saveImage:@"https://file.wchoosemall.com/platform/manager/pic/20190325/7448903938448587.jpg" Completion:^(BOOL success) {
//            if (success) {
//                [SVProgressHUD showSuccessWithStatus:@"保存成功啊啊啊啊"];
//            }else{
//                [SVProgressHUD showErrorWithStatus:@"保存失败啊啊啊啊"];
//            }
//        }];
    }else if (sender.tag==13){
        
        [CustomAlert showCustomAlertAddTarget:self Title:nil TitleFont:FontRegular(12) TitleColor:[UIColor redColor] Message:@"内容内容内容内容内容内容内容内容" MessageFont:nil MessageColor:nil MessageAlignment:NSTextAlignmentCenter CancelBtnTitle:@"取消" CancelBtnColor:nil DefaultBtnTitle:@"确定" DefaultBtnColor:[UIColor purpleColor] ActionHandle:^(NSInteger actionIndex, NSString * _Nonnull btnTitle) {
            DLog(@"%ld>>>>>>>>>>>>",actionIndex);
            if (actionIndex==1) {
                DLog(@"点击确定");
            }
        }];
    }
    
}

/*
 {
     "success" = 1;
     "data" = {
     "list" = (
 );
 };
     "debugInfo" = {
     "url" = http://www.wchoosemall.com:80/doc/api/common/indexCustomConfig/indexCustomConfigV1.json?data=%7B%22appPlatform%22%3A1%2C%22configType%22%3A2%7D&Metadata=AppStore_iOS_13.4.1_1.9.2;
     "data" = {"appPlatform":1,"configType":2};
 };
     "timestamp" = 1592281654062;
 }
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
