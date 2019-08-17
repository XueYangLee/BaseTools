//
//  CustomAlert.h
//  BaseTools
//
//  Created by Singularity on 2019/4/19.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomAlert : NSObject



/**
 alert弹框 可配置按钮文字

 @param viewController 来源视图
 @param title 标题
 @param message 内容
 @param cancelBtnTitle 取消按钮文字
 @param defaultBtnTitle 默认按钮文字
 @param actionHandle 操作
 */
+ (void)showAlertAddTarget:(UIViewController *)viewController Title:(NSString *_Nullable)title Message:(NSString *_Nullable)message CancelBtnTitle:(NSString *_Nullable)cancelBtnTitle DefaultBtnTitle:(NSString *_Nullable)defaultBtnTitle ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle;


/**
 alert弹框 多按钮配置

 @param viewController 来源视图
 @param title 标题
 @param message 内容
 @param cancelBtnTitle 取消按钮文字
 @param otherBtnTitles 默认按钮文字
 @param actionHandle 操作
 */
+ (void)showAlertWithBtnsAddTarget:(UIViewController *)viewController Title:(NSString *_Nullable)title Message:(NSString *_Nullable)message CancelBtnTitle:(NSString *_Nullable)cancelBtnTitle OtherBtnTitles:(NSArray *_Nullable)otherBtnTitles ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle;



/**
 actionSheet弹框

 @param viewController 来源视图
 @param title 标题
 @param message 内容
 @param redWarnBtnTitle 红色按钮文字
 @param cancelBtnTitle 取消按钮文字
 @param otherBtnTitles 默认按钮文字
 @param actionHandle 操作
 */
+ (void)showActionSheetAddTarget:(UIViewController *)viewController Title:(NSString *_Nullable)title Message:(NSString *_Nullable)message RedWarnBtnTitle:(NSString *_Nullable)redWarnBtnTitle CancelBtnTitle:(NSString *_Nullable)cancelBtnTitle OtherBtnTitles:(NSArray *_Nullable)otherBtnTitles ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle;




/**
 alert提示弹框 仅提示无操作内容

 @param viewController 来源视图
 @param title 标题
 @param message 内容
 @param actionTitle 按钮文字
 */
+ (void)showAlertRemindAddTarget:(UIViewController *)viewController Title:(NSString *_Nullable)title Message:(NSString *_Nullable)message ActionTitle:(NSString *_Nullable)actionTitle;



/**
 alert信息提示框  按钮文字@“确认”

 @param viewController 来源视图
 @param message 信息内容
 */
+ (void)showAlertMessageConfirmAddTarget:(UIViewController *)viewController Message:(NSString *_Nullable)message;



/**
 alert弹框 确认取消

 @param viewController 来源视图
 @param title 标题
 @param message 内容
 @param actionHandle 按钮文字
 */
+ (void)showAlertAddTarget:(UIViewController *)viewController Title:(NSString *_Nullable)title Message:(NSString *_Nullable)message ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle;







/**
 自定义alert 文字大小及颜色

 @param viewController 来源视图
 @param title 标题
 @param titleFont 标题文字属性
 @param titleColor 标题颜色
 @param message 内容
 @param messageFont 内容文字属性
 @param messageColor 内容颜色
 @param messageAlignment 内容对齐方式
 @param cancelBtnTitle 取消按钮文字
 @param cancelBtnColor 取消按钮文字颜色
 @param defaultBtnTitle 默认按钮文字
 @param defaultBtnColor 默认按钮文字颜色
 @param actionHandle 操作
 */
+ (void)showCustomAlertAddTarget:(UIViewController *)viewController Title:(NSString *_Nullable)title TitleFont:(UIFont *_Nullable)titleFont TitleColor:(UIColor *_Nullable)titleColor Message:(NSString *_Nullable)message MessageFont:(UIFont *_Nullable)messageFont MessageColor:(UIColor *_Nullable)messageColor MessageAlignment:(NSTextAlignment)messageAlignment CancelBtnTitle:(NSString *_Nullable)cancelBtnTitle CancelBtnColor:(UIColor *_Nullable)cancelBtnColor DefaultBtnTitle:(NSString *_Nullable)defaultBtnTitle DefaultBtnColor:(UIColor *_Nullable)defaultBtnColor ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle;



@end

NS_ASSUME_NONNULL_END
