//
//  OppositeBtn.h
//  CarSteward
//
//  Created by 李雪阳 on 2018/6/6.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OppositeBtn : UIButton

- (void)buttonWithTitle:(NSString *)title Font:(NSInteger)font TitleColor:(UIColor *)titleColor Image:(UIImage *)image;


/**
 图片跟文字间距 默认2
 */
@property (nonatomic,assign) NSInteger interval;

@end
