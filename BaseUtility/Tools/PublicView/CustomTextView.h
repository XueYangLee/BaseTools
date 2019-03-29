//
//  CustomTextView.h
//  moneyhll
//
//  Created by 李雪阳 on 16/10/29.
//  Copyright © 2016年 浙江龙之游旅游开发有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTextView : UITextView<UITextViewDelegate>
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
