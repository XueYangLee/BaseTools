//
//  UserCenter.m
//  NowMeditation
//
//  Created by Singularity on 2020/11/2.
//

#import "UserCenter.h"

static NSString *UserInfoKey = @"UserInfoKey";

@interface UserCenter ()

@property (nonatomic,strong) UserInfoModel *userInfo;

@end

@implementation UserCenter

+ (instancetype)sharedCenter{
    static UserCenter *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[UserCenter alloc] init];
    });
    return shareManager;
}

// MARK: - userFunction

- (void)getUserInfo{
    [self getUserInfoWithComp:nil];
}

- (void)getUserInfoWithComp:(void(^ __nullable)(BOOL success))comp{
    
    
    comp?comp(YES):nil;
}

- (UserInfoModel *)userInfo{
    if (!_userInfo) {
        NSString *cacheStr = [[NSUserDefaults standardUserDefaults]objectForKey:UserInfoKey];
        _userInfo = [UserInfoModel yy_modelWithJSON:cacheStr];
    }
    return _userInfo;
}

- (void)updateUserInfo:(NSDictionary *)userInfoDic{

    NSString *compareUserId=self.userInfo.id;
    
    UserInfoModel *info=[UserInfoModel yy_modelWithJSON:userInfoDic];
    self.userInfo=info;
    [self saveUserInfo:info];
    
    BOOL beChanged = YES;
    if (self.userInfo.id && compareUserId && [self.userInfo.id isEqualToString:compareUserId]) {//用户是否切换身份
        beChanged = NO;
    }
    if (beChanged) {
        //用户状态改变

    }
}

- (void)saveUserInfo:(UserInfoModel *)model{
    [[NSUserDefaults standardUserDefaults]setObject:[model yy_modelToJSONString] forKey:UserInfoKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)removeUserInfo{
    self.userInfo = nil;
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:UserInfoKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)cleanUserData{
    
    [self removeUserInfo];
}

- (void)logout{
    [self cleanUserData];
}


//MARK: - userState

- (void)checkMemberStatus{
    if (!self.isVIP) {
        //重新获取用户等级
    }
}

- (BOOL)isVIP{
    return NO;
}

- (BOOL)isLogin{
    return NO;
}

- (BOOL)judgeLogin{
    if (!self.isLogin) {
        [PageJump jumpToLogin];
        return NO;
    }
    return YES;
}
//MARK: - userBase



@end
