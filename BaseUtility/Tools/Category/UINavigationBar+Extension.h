//
//  UINavigationBar+Extension.h
//  textPod
//
//  Created by 李雪阳 on 2017/11/27.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Extension)


/**
 变换导航背景色
 在viewdidload中改变 [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
 */
- (void)navi_setBackgroundColor:(UIColor *)backgroundColor;

- (void)navi_setElementsAlpha:(CGFloat)alpha;

- (void)navi_setTranslationY:(CGFloat)translationY;

/**
 页面结束时在viewWillDisappear中调用重置
 */
- (void)navi_reset;



/**
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView
 {
 UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
 CGFloat offsetY = scrollView.contentOffset.y;
 if (offsetY > 50) {
 CGFloat alpha = MIN(1, 1 - ((50 + 64 - offsetY) / 64));
 [self.navigationController.navigationBar navi_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
 } else {
 [self.navigationController.navigationBar navi_setBackgroundColor:[color colorWithAlphaComponent:0]];
 }
 }
 */

@end
