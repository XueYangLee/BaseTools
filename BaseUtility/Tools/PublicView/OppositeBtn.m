
//
//  OppositeBtn.m
//  CarSteward
//
//  Created by 李雪阳 on 2018/6/6.
//  Copyright © 2018年 singularity. All rights reserved.
//图片在右 文字在左

#import "OppositeBtn.h"

@implementation OppositeBtn

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect titleF = self.titleLabel.frame;
    CGRect imageF = self.imageView.frame;
    
    titleF.origin.x = 0;
    self.titleLabel.frame = titleF;
    
    imageF.origin.x = CGRectGetMaxX(titleF) + (_interval? :2);
    self.imageView.frame = imageF;
}

- (void)setInterval:(NSInteger)interval{
    _interval=interval;
}

- (void)buttonWithTitle:(NSString *)title Font:(NSInteger)font TitleColor:(UIColor *)titleColor Image:(UIImage *)image{
    self.titleLabel.font=[UIFont systemFontOfSize:font];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setImage:image forState:UIControlStateNormal];
}

@end
