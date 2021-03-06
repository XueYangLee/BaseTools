//
//  BaseCollectionViewController.h
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseDataRefreshProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewController : BaseViewController<UICollectionViewDelegate,UICollectionViewDataSource,BaseDataRefreshProtocol>


@property (nonatomic, strong) UICollectionView *collectionView;

/** 修改collectionView的UICollectionViewFlowLayout */
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;



/** 是否显示刷新控件刷新头（下拉刷新）  默认不显示 */
@property (nonatomic, assign) BOOL showRefreshHeader;

/** 是否显示刷新控件刷新尾（上拉加载）  默认不显示 */
@property (nonatomic, assign) BOOL showRefreshFooter;

/** 页码 */
@property (nonatomic, assign) NSInteger refreshPages;



/** 无数据空页面是否显示  默认显示 */
@property (nonatomic, assign) BOOL empty_showData;
/** 无数据空页面是否跟随滚动  默认允许 */
@property (nonatomic, assign) BOOL empty_allowScroll;
/** 无数据空页面图片  不传即显示默认图片 */
@property (nonatomic, strong) UIImage *empty_image;
/** 无数据空页面标题  不传即显示默认标题 */
@property (nonatomic, copy) NSString *empty_title;
/** 无数据空页面副标题 */
@property (nonatomic, copy) NSString *empty_subTitle;
/** 无数据空页面按钮文字 */
@property (nonatomic, copy) NSString *empty_buttonTitle;
/** 无数据空页面按钮背景图（边框图，位置大小不合适需调整inset） */
@property (nonatomic, strong) UIImage *empty_buttonBackgroundImage;
/** 无数据空页面背景色 */
@property (nonatomic, strong) UIColor *empty_backgroundColor;

/** 无数据空页面按钮点击事件 */
- (void)empty_buttonClick;
/** 无数据空页面背景点击事件（图片文字范围） */
- (void)empty_tapEmptyView;


@end

NS_ASSUME_NONNULL_END
