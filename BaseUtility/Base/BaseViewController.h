//
//  BaseViewController.h
//  textPod
//
//  Created by 李雪阳 on 2017/11/21.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController

/** 页码 */
@property (nonatomic, assign) NSInteger pages;
/** 数据总数 */
@property (nonatomic, assign) NSInteger totalCount;

/**
 CGRectZero是否从导航栏下开始计算 默认YES
 */
@property (assign,nonatomic) BOOL edgesExtendLayout;


/**
 隐藏显示导航栏

 @param isHide 是否隐藏导航栏
 */
- (void)hideNavigationBar:(BOOL)isHide;


/**
 设置左侧导航栏按钮

 @param imageName 图片名
 */
- (void)setNavigationLeftBarBtnItemWithImgName:(NSString *)imageName Action:(SEL)selector;


/**
 设置右侧导航栏按钮

 @param title 标题（无传nil）
 @param imageName 图片名（无传nil）
 */
- (void)setNavigationRightBarBtnItemWithTitle:(NSString *)title ImgName:(NSString *)imageName Action:(SEL)selector;


/**
 状态栏类型及显示隐藏

 @param statusBarStyle 类型  UIStatusBarStyleDefault 黑色   UIStatusBarStyleLightContent 白色
 @param statusBarHidden 显示隐藏
 */
- (void)changeStatusBarStyle:(UIStatusBarStyle)statusBarStyle statusBarHidden:(BOOL)statusBarHidden;


/**
 更改statusBar颜色（离开页面需调用移除）
 */
- (void)changeStatusBarColor:(UIColor *)barColor;


/**
 移除statusbar颜色
 */
- (void)removeStatusBarColor;



/**
 是否隐藏导航栏下阴影线 默认不隐藏
 */
- (void)hideNavigationBarShadowImage:(BOOL)hidden;


/**
 初始化tableview（需添加代理）
 */
- (UITableView *)tableViewWithFrame:(CGRect)frame Style:(UITableViewStyle)style;




/**
 数据刷新

 @param dataArray 数组
 @param scrollView 使用的滚动视图
 @param isUseFooter YES 使用翻页   NO 不使用翻页
 */
- (void)refreshData:(NSMutableArray *)dataArray ScrollView:(UIScrollView *)scrollView RefreshFooter:(BOOL)isUseFooter;


/**
 数据源
 */
- (void)setData;


@end
