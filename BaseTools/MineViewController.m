//
//  MineViewController.m
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH-125-5, (192-17)/2)];
    [SDWebImageDownloader.sharedDownloader setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [img sd_setImageWithURL:[NSURL URLWithString:@"https://img.alicdn.com/tps/i4/TB1ijbpOCzqK1RjSZFHSuv3CpXa.jpg"]];
    [self.view addSubview:img];
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
