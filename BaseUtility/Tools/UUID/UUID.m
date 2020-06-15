//
//  UUID.m
//  BaseTools
//
//  Created by 李雪阳 on 2020/6/9.
//  Copyright © 2020 Singularity. All rights reserved.
//

#import "UUID.h"
#import <AdSupport/AdSupport.h>
#import "KeyChainStore.h"

#define  KEY_USERNAME_PASSWORD @"com.company.app.usernamepassword"

@implementation UUID

+ (NSString *)getUUID {
    NSString * strUUID = (NSString *)[KeyChainStore load:KEY_USERNAME_PASSWORD];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID) {
        
        strUUID = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        
        if (strUUID.length ==0 || [strUUID isEqualToString:@"00000000-0000-0000-0000-000000000000"] || ![[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]){
            //生成一个uuid的方法
            CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
            
            strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        }
        
        //将该uuid保存到keychain
        [KeyChainStore save:KEY_USERNAME_PASSWORD data:strUUID];
        
    }
    return strUUID;
}


@end
