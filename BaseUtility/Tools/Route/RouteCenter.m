//
//  RouteCenter.m
//  BaseTools
//
//  Created by 李雪阳 on 2020/10/27.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "RouteCenter.h"
#import "PageJump.h"

static NSString *routeHost = @"wg://push.chuang.co";

@implementation RouteCenter

+ (BOOL)jumpWithURL:(NSString *)URLString {
    
    if ([[CustomTools trimWhiteSpaceAndNewLine:URLString] hasPrefix:@"http://"] || [[CustomTools trimWhiteSpaceAndNewLine:URLString] hasPrefix:@"https://"]) {
        //直接跳转到网页;
        [PageJump jumpToWebWithURL:URLString];
        
        return YES;
    }else {
        
        if ([[CustomTools trimWhiteSpaceAndNewLine:URLString] hasPrefix:routeHost]) {
        
            NSURL *URL = [NSURL URLWithString:[CustomTools trimWhiteSpaceAndNewLine:URLString]];
            NSString *queryString = URL.query;
            if (queryString.length == 0) {
                //跳转到首页
                [PageJump jumpToHomeTab];
            }else {
                NSArray *queryArray = [queryString componentsSeparatedByString:@"&"];
                NSString *pushQuery = nil;//跳转目标
                
                NSMutableDictionary *params = [NSMutableDictionary dictionary];//参数
                for (NSString *queryString in queryArray) {
                    if ([queryString hasPrefix:@"page="]) {
                        pushQuery = queryString;
                    }else {
                        NSArray *portion = [queryString componentsSeparatedByString:@"="];
                        [params setObject:[portion lastObject] forKey:[portion firstObject]];
                    }
                }
                
                NSString *routeString = nil;
                if (pushQuery) {
                    routeString = [[pushQuery componentsSeparatedByString:@"="] lastObject];
                }
                
                if (routeString && [routeString isEqualToString:@"****"]){
                    
                }else if (routeString && [routeString isEqualToString:@"****"]){
                    
                }
            }
            
            return YES;
        }else{
            if (URLString.length!=0) {
                [SVProgressHUD showErrorWithStatus:@"哎呀，找不到目标..."];
            }
        }
    }
    return NO;
}

@end
