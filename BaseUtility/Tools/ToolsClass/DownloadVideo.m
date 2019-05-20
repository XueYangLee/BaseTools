//
//  DownloadVideo.m
//  WeiGuGlobal
//
//  Created by Singularity on 2019/5/9.
//  Copyright © 2019 com.chuang.global. All rights reserved.
//

#import "DownloadVideo.h"

@implementation DownloadVideo


//-----下载视频--
+ (void)videoDownloadWithUrl:(NSString *)videoUrl{
    
    
    [SVProgressHUD showWithStatus:@"保存中"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSArray *urlSuffix=[videoUrl componentsSeparatedByString:@"/"];//获取最后 *****.mp4
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString  *fullPath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, urlSuffix.lastObject];
    NSURL *urlNew = [NSURL URLWithString:videoUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlNew];
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        return [NSURL fileURLWithPath:fullPath];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        [self saveVideo:fullPath];
    }];
    [task resume];
    
}

//videoPath为视频下载到本地之后的本地路径
+ (void)saveVideo:(NSString *)videoPath{
    
    if (videoPath) {
        NSURL *url = [NSURL URLWithString:videoPath];
        BOOL compatible = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum([url path]);
        if (compatible){
            //保存相册核心代码
            UISaveVideoAtPathToSavedPhotosAlbum([url path], self, @selector(savedPhotoImage:didFinishSavingWithError:contextInfo:), nil);
        }
    }
}


//保存视频完成之后的回调
+ (void)savedPhotoImage:(UIImage*)image didFinishSavingWithError: (NSError *)error contextInfo: (void *)contextInfo {
    if (error) {
//        DLog(@"保存视频失败%@", error.localizedDescription);
        [SVProgressHUD showErrorWithStatus:@"视频保存失败"];
    }else {
//        DLog(@"保存视频成功");
        [SVProgressHUD showSuccessWithStatus:@"视频保存成功"];
    }
}


@end
