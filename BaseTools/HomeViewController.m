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

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"内容测试";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cid"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cid"];
    }
    cell.textLabel.text=self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        TableViewController *table=[TableViewController new];
        NaviRoutePushToVC(table, YES);
//        NaviRoutePresentToVC(table);
//        [[UIViewController currentViewController].navigationController pushViewController:table animated:YES];
    }else if (indexPath.row==1){
        CollectionViewController *collect=[CollectionViewController new];
        NaviRoutePushToVC(collect, YES);
    }else if (indexPath.row==2){
        WKWebViewController *web=[WKWebViewController new];
        NaviRoutePushToVC(web, YES);
    }else if (indexPath.row==3){
        [CustomAlert showCustomAlertAddTarget:self Title:nil TitleFont:FontRegular(12) TitleColor:[UIColor redColor] Message:@"内容内容内容内容内容内容内容内容" MessageFont:nil MessageColor:nil MessageAlignment:NSTextAlignmentCenter CancelBtnTitle:@"取消" CancelBtnColor:nil DefaultBtnTitle:@"确定" DefaultBtnColor:[UIColor purpleColor] ActionHandle:^(NSInteger actionIndex, NSString * _Nonnull btnTitle) {
            DLog(@"%ld>>>>>>>>>>>>",actionIndex);
            if (actionIndex==1) {
                DLog(@"点击确定");
            }
        }];
    }else if (indexPath.row==4){
        [SVProgressHUD showWithStatus:@"保存中"];
        [SaveImageManager saveImage:@"https://file.wchoosemall.com/platform/manager/pic/20190325/7448903938448587.jpg" Completion:^(BOOL success) {
            if (success) {
                [SVProgressHUD showSuccessWithStatus:@"保存成功"];
            }else{
                [SVProgressHUD showErrorWithStatus:@"保存失败"];
            }
        }];
    }else if (indexPath.row==5){

        [DownloadVideo videoDownloadWithUrl:@"https://www.apple.com/105/media/cn/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-cn-20170912_1280x720h.mp4" Progress:^(NSProgress * _Nonnull progress, double downloadProgress) {
            [SVProgressHUD showProgress:downloadProgress status:[NSString stringWithFormat:@"%.f%%",downloadProgress*100]];
        } Completion:^(BOOL success) {
            [SVProgressHUD showSuccessWithStatus:success?@"保存成功":@"保存失败"];
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


- (NSMutableArray *)dataArray{
    if (_dataArray==nil){
        _dataArray=[NSMutableArray arrayWithArray:@[@"TableViewController",@"CollectionViewController",@"WKWebViewController",@"自定义弹框",@"下载图片",@"下载视频"]];
    }
    return _dataArray;
}

@end
