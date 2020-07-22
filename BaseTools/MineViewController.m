//
//  MineViewController.m
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "MineViewController.h"
#import "CustomNetWorkResumeDownload.h"

@interface MineViewController ()

@property (nonatomic,assign) BOOL downloading;
@property (nonatomic,strong) NSURLSessionDownloadTask *downloadTask;

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
    
    
    UITextField *textField=UITextField.func_init.func_frame(CGRectMake(10, 200, 200, 40)).func_text(@"textField").func_placeholder(@"placeholder").func_placeholderColor([UIColor blueColor]).func_borderStyle(UITextBorderStyleLine).func_clearButtonMode(UITextFieldViewModeWhileEditing);
    [self.view addSubview:textField];
    
    
    UIButton *btn=[UIButton new].func_frame(CGRectMake(10, 250, 100, 100)).func_backgroundColor([UIColor blueColor]).func_title(@"默认文字").func_title_state(@"点击文案",UIControlStateSelected).func_font(FontLight(12)).func_addTarget_action(self,@selector(btnClick:));
    [self.view addSubview:btn];
    
    
    UIButton *download=[UIButton new].func_frame(CGRectMake(150, 250, 50, 50)).func_title(@"开始下载").func_title_state(@"暂停下载",UIControlStateSelected).func_font(FontRegular(12)).func_titleColor(UIColor.blackColor).func_backgroundColor(UIColor.yellowColor).func_addTarget_action(self,@selector(downloadClick:));
    [self.view addSubview:download];
}

- (void)btnClick:(UIButton *)sender{
    sender.selected=!sender.selected;
}


- (void)downloadClick:(UIButton *)sender{
    if (sender.selected) {
        if (self.downloading) {
            //可以在这里存储resumeData ,也可以去QDNetServerDownLoadTool 里面 根据那个通知去处理 都有回调的
            [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
                DLog(@"续传的data = %@",resumeData)
            }];
            self.downloading=NO;
        }
    }else{
        if (self.downloading) {
            return;
        }
        self.downloading=YES;
        
        NSURLSessionDownloadTask *task=[[CustomNetWorkResumeDownload sharedManager]downloadFileWithUrl:@"https://www.apple.com/105/media/cn/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-cn-20170912_1280x720h.mp4" FileName:@"testDownload.mp4" Progress:^(double progress) {
            DLog(@"%f>>>>>progress",progress)
        } Completion:^(BOOL success, NSURLResponse * _Nonnull response, NSURL * _Nullable filePath) {
            if (success) {
                DLog(@"%@>response>>\n>%@>>>filePath",response,filePath.absoluteString)
                // file:///Users/mac/Library/Developer/CoreSimulator/Devices/9A53D572-F5E0-42B3-84B3-88076DED4F1C/data/Containers/Data/Application/C5253674-522A-413F-A93C-FBBA46A126F1/Documents/testDownload.mp4
            }
        }];
        self.downloadTask=task;
    }
    
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
