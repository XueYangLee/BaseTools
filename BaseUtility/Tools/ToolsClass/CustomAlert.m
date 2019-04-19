//
//  CustomAlert.m
//  BaseTools
//
//  Created by Singularity on 2019/4/19.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "CustomAlert.h"

@implementation CustomAlert


+ (void)showAlertAddTarget:(UIViewController *)viewController Title:(NSString *)title Message:(NSString *)message CancelBtnTitle:(NSString *)cancelBtnTitle DefaultBtnTitle:(NSString *)defaultBtnTitle ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancelBtnTitle) {
        __weak typeof(alert) weakAlert = alert;
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            __strong typeof(weakAlert) alert = weakAlert;
            if (actionHandle) {
                actionHandle([alert.actions indexOfObject:action], action.title);
            }
        }];
        [alert addAction:cancelAction];
    }
    
    if (defaultBtnTitle) {
        __weak typeof(alert) weakAlert = alert;
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:defaultBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            __strong typeof(weakAlert) alert = weakAlert;
            if (actionHandle) {
                actionHandle([alert.actions indexOfObject:action], action.title);
            }
        }];
        [alert addAction:defaultAction];
    }
    
    
    [viewController presentViewController:alert animated:YES completion:nil];
    
//    UIViewController *currentViewController = viewController;
//    while (currentViewController.presentedViewController) {
//        currentViewController = currentViewController.presentedViewController;
//    }
//    [currentViewController presentViewController:alert animated:YES completion:nil];
}

+ (void)showAlertWithBtnsAddTarget:(UIViewController *)viewController Title:(NSString *)title Message:(NSString *)message CancelBtnTitle:(NSString *)cancelBtnTitle OtherBtnTitles:(NSArray *)otherBtnTitles ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancelBtnTitle) {
        __weak typeof(alert) weakAlert = alert;
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            __strong typeof(weakAlert) alert = weakAlert;
            if (actionHandle) {
                actionHandle([alert.actions indexOfObject:action], action.title);
            }
        }];
        [alert addAction:cancelAction];
    }
    
    if (otherBtnTitles.count!=0) {
        __weak typeof(alert) weakAlert = alert;
        for (NSString *defaultBtnTitle in otherBtnTitles) {
            UIAlertAction *defaultAction=[UIAlertAction actionWithTitle:defaultBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                __strong typeof(weakAlert) alert = weakAlert;
                if (actionHandle) {
                    actionHandle([alert.actions indexOfObject:action], action.title);
                }
            }];
            [alert addAction:defaultAction];
        }
        
    }
    
    [viewController presentViewController:alert animated:YES completion:nil];
}



+ (void)showActionSheetAddTarget:(UIViewController *)viewController Title:(NSString *)title Message:(NSString *)message RedWarnBtnTitle:(NSString *)redWarnBtnTitle CancelBtnTitle:(NSString *)cancelBtnTitle OtherBtnTitles:(NSArray *)otherBtnTitles ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (cancelBtnTitle) {
        __weak typeof(alert) weakAlert = alert;
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            __strong typeof(weakAlert) alert = weakAlert;
            if (actionHandle) {
                actionHandle([alert.actions indexOfObject:action], action.title);
            }
        }];
        [alert addAction:cancelAction];
    }
    
    if (redWarnBtnTitle) {
        __weak typeof(alert) weakAlert = alert;
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:redWarnBtnTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            __strong typeof(weakAlert) alert = weakAlert;
            if (actionHandle) {
                actionHandle([alert.actions indexOfObject:action], action.title);
            }
        }];
        [alert addAction:destructiveAction];
    }
    
    if (otherBtnTitles.count!=0) {
        __weak typeof(alert) weakAlert = alert;
        for (NSString *defaultBtnTitle in otherBtnTitles) {
            UIAlertAction *defaultAction=[UIAlertAction actionWithTitle:defaultBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                __strong typeof(weakAlert) alert = weakAlert;
                if (actionHandle) {
                    actionHandle([alert.actions indexOfObject:action], action.title);
                }
            }];
            [alert addAction:defaultAction];
        }
    }
    
    
    
    [viewController presentViewController:alert animated:YES completion:nil];
}





+ (void)showAlertRemindAddTarget:(UIViewController *)viewController Title:(NSString *)title Message:(NSString *)message ActionTitle:(NSString *)actionTitle{
    
    [self showAlertAddTarget:viewController Title:title Message:message CancelBtnTitle:actionTitle DefaultBtnTitle:nil ActionHandle:nil];
}

+ (void)showAlertMessageConfirmAddTarget:(UIViewController *)viewController Message:(NSString *)message{
    
    [self showAlertAddTarget:viewController Title:nil Message:message CancelBtnTitle:@"确认" DefaultBtnTitle:nil ActionHandle:nil];
}

+ (void)showAlertAddTarget:(UIViewController *)viewController Title:(NSString *)title Message:(NSString *)message ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle{
    
    [self showAlertAddTarget:viewController Title:title Message:message CancelBtnTitle:@"取消" DefaultBtnTitle:@"确认" ActionHandle:actionHandle];
}


+ (void)showAlertContentAlignmentAddTarget:(UIViewController *)viewController Title:(NSString *)title TitleAlignment:(NSTextAlignment)titleAlignment Message:(NSString *)message MessageAlignment:(NSTextAlignment)messageAlignment CancelBtnTitle:(NSString *)cancelBtnTitle DefaultBtnTitle:(NSString *)defaultBtnTitle ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIView *subView1 = alert.view.subviews[0];
    UIView *subView2 = subView1.subviews[0];
    UIView *subView3 = subView2.subviews[0];
    UIView *subView4 = subView3.subviews[0];
    UIView *subView5 = subView4.subviews[0];
    
    UILabel *titleLabel = subView5.subviews[0];
    UILabel *messageLabel = subView5.subviews[1];
    
    if (titleAlignment) {
        titleLabel.textAlignment = titleAlignment;
    }
    
    if (messageAlignment) {
        messageLabel.textAlignment = messageAlignment;
    }
    
    if (cancelBtnTitle) {
        __weak typeof(alert) weakAlert = alert;
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            __strong typeof(weakAlert) alert = weakAlert;
            if (actionHandle) {
                actionHandle([alert.actions indexOfObject:action], action.title);
            }
        }];
        [alert addAction:cancelAction];
    }
    
    if (defaultBtnTitle) {
        __weak typeof(alert) weakAlert = alert;
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:defaultBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            __strong typeof(weakAlert) alert = weakAlert;
            if (actionHandle) {
                actionHandle([alert.actions indexOfObject:action], action.title);
            }
        }];
        [alert addAction:defaultAction];
    }
    
    [viewController presentViewController:alert animated:YES completion:nil];
    
}


+ (void)showCustomAlertAddTarget:(UIViewController *)viewController Title:(NSString *)title TitleFont:(UIFont *)titleFont TitleColor:(UIColor *)titleColor Message:(NSString *)message MessageFont:(UIFont *)messageFont MessageColor:(UIColor *)messageColor CancelBtnTitle:(NSString *)cancelBtnTitle CancelBtnColor:(UIColor *)cancelBtnColor DefaultBtnTitle:(NSString *)defaultBtnTitle DefaultBtnColor:(UIColor *)defaultBtnColor ActionHandle:(void (^ __nullable)(NSInteger actionIndex,NSString *btnTitle))actionHandle{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (title) {
        
        NSMutableAttributedString *attributedTitStr = [[NSMutableAttributedString alloc] initWithString:title];
        //设置颜色
        if (titleColor) {
            [attributedTitStr addAttribute:NSForegroundColorAttributeName value:titleColor range:NSMakeRange(0, attributedTitStr.length)];
        }
        
        //设置大小
        if (titleFont) {
            [attributedTitStr addAttribute:NSFontAttributeName value:titleFont range:NSMakeRange(0, attributedTitStr.length)];
        }
        
        [alert setValue:attributedTitStr forKey:@"attributedTitle"];
    }
    
    if (message) {
        
        NSMutableAttributedString *attributedMesStr = [[NSMutableAttributedString alloc] initWithString:message];
        //设置颜色
        if (messageColor) {
            [attributedMesStr addAttribute:NSForegroundColorAttributeName value:messageColor range:NSMakeRange(0, attributedMesStr.length)];
        }
        
        //设置大小
        if (messageFont) {
            [attributedMesStr addAttribute:NSFontAttributeName value:messageFont range:NSMakeRange(0, attributedMesStr.length)];
        }
        
        
        [alert setValue:attributedMesStr forKey:@"attributedMessage"];
    }
    
    
    if (cancelBtnTitle) {
        __weak typeof(alert) weakAlert = alert;
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            __strong typeof(weakAlert) alert = weakAlert;
            if (actionHandle) {
                actionHandle([alert.actions indexOfObject:action], action.title);
            }
        }];
        [alert addAction:cancelAction];
        
        
        if (cancelBtnColor) {
            [cancelAction setValue:cancelBtnColor forKey:@"titleTextColor"];
        }
    }
    
    if (defaultBtnTitle) {
        __weak typeof(alert) weakAlert = alert;
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:defaultBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            __strong typeof(weakAlert) alert = weakAlert;
            if (actionHandle) {
                actionHandle([alert.actions indexOfObject:action], action.title);
            }
        }];
        [alert addAction:defaultAction];
        
        
        if (defaultBtnColor) {
            [defaultAction setValue:defaultBtnColor forKey:@"titleTextColor"];
        }
    }
    
    [viewController presentViewController:alert animated:YES completion:nil];
    
}


@end
