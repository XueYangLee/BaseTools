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
    
    
    [DateOperation intervalTimeFromTimeStamp:@"1555311009000" ToTimeStamp:nil Completion:^(NSString *year, NSString *month, NSString *day, NSString *hour, NSString *minute, NSString *second) {
        DLog(@"%@>天>%@>时>>%@>分>>%@>秒>>",day,hour,minute,second);
    }];
    
    NSString *secInterval=[DateOperation intervalTimeWithMinuteSecFromTimeStamp:@"1555316485000" ToTimeStamp:nil];
    DLog(@"%@>>>>>",secInterval);
    
    
    UITextField *textField=UITextField.func_init.func_frame(CGRectMake(10, 200, 200, 40)).func_text(@"textField").func_placeholder(@"placeholder").func_borderStyle(UITextBorderStyleLine).func_clearButtonMode(UITextFieldViewModeWhileEditing);
    [self.view addSubview:textField];
    
    
    UIButton *btn=[UIButton new].func_frame(CGRectMake(10, 250, 100, 100)).func_backgroundColor([UIColor blueColor]).func_title(@"默认文字").func_title_state(@"点击文案",UIControlStateSelected).func_font(FontLight(12)).func_addTarget_action(self,@selector(btnClick:));
    [self.view addSubview:btn];
    
}

- (void)btnClick:(UIButton *)sender{
    sender.selected=!sender.selected;
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
