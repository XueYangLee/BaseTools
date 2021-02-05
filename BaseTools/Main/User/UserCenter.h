//
//  UserCenter.h
//  NowMeditation
//
//  Created by Singularity on 2020/11/2.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserCenter : NSObject

+ (instancetype)sharedCenter;


//MARK: - user

@property (nonatomic,strong,readonly) UserInfoModel *userInfo;

/** 获取最新用户信息 */
- (void)getUserInfo;

/** 获取用户最新信息  回调 */
- (void)getUserInfoWithComp:(void(^ __nullable)(BOOL success))comp;

/** 更新用户信息 */
- (void)updateUserInfo:(NSDictionary *)userInfoDic;

/** 保存用户信息 */
- (void)saveUserInfo:(UserInfoModel *)model;

/** 移除用户信息 */
- (void)removeUserInfo;

/** 清除所有用户信息 */
- (void)cleanUserData;

/** 登出操作 */
- (void)logout;

/** 检查用户等级 */
- (void)checkMemberStatus;

/** 是否为会员 */
- (BOOL)isVIP;

/** 是否登陆 */
- (BOOL)isLogin;

/** 判断是否登陆 没登录跳转登录页面 */
- (BOOL)judgeLogin;


//MARK: - userProperty

@end

NS_ASSUME_NONNULL_END
