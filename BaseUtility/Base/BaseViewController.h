//
//  BaseViewController.h
//  textPod
//
//  Created by 李雪阳 on 2017/11/21.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController


/** CGRectZero是否从导航栏下开始计算 默认YES */
@property (assign,nonatomic) BOOL edgesExtendLayout;

/** 是否隐藏显示导航栏  默认显示 不隐藏 */
@property (nonatomic,assign) BOOL hideNavigationBar;

/** 是否隐藏导航栏下阴影线 默认隐藏 */
@property (nonatomic,assign) BOOL hideNaviShadow;



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
 初始化tableview（需添加代理）
 */
- (UITableView *)tableViewWithFrame:(CGRect)frame Style:(UITableViewStyle)style;



/** 页码 */
@property (nonatomic, assign) NSInteger pages;
/** 数据总数 */
@property (nonatomic, assign) NSInteger totalCount;

/**
 数据刷新  数据加载完成结束头部及脚步的刷新

 @param dataArray 数组
 @param scrollView 使用的滚动视图
 @param showFooter YES 使用翻页   NO 不使用翻页
 */
- (void)refreshData:(NSMutableArray *)dataArray ScrollView:(UIScrollView *)scrollView RefreshFooter:(BOOL)showFooter;




@end
