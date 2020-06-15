//
//  BaseViewController.m
//  textPod
//
//  Created by 李雪阳 on 2017/11/21.
//  Copyright © 2017年 singularity. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) BOOL statusBarHidden;
@property (nonatomic, strong) UIView *statusBarView;

@property (nonatomic, strong) UITableView *base_tableView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=UIColorWithRGBA(247, 247, 247, 1);
    
    [self setEdgesExtendLayout:YES];//坐标是否从导航栏下计算
    [self setHideNavigationBar:NO];//隐藏显示导航栏
    [self setHideNaviShadow:NO];//是否隐藏导航栏下阴影线
}

//坐标是否从导航栏下计算
- (void)setEdgesExtendLayout:(BOOL)edgesExtendLayout{
    if (edgesExtendLayout==YES){
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
            self.edgesForExtendedLayout=UIRectEdgeNone;
        }
    }else{
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
            self.edgesForExtendedLayout=UIRectEdgeAll;
        }
    }
}

//隐藏显示导航栏
- (void)setHideNavigationBar:(BOOL)hideNavigationBar{
    self.navigationController.navigationBarHidden=hideNavigationBar;
}

//是否隐藏导航栏下阴影线
- (void)setHideNaviShadow:(BOOL)hideNaviShadow{
    [self.navigationController.navigationBar setShadowImage:(hideNaviShadow)?[UIImage new]:nil];
}



//左侧导航栏按钮
- (void)setNavigationLeftBarBtnItemWithImgName:(NSString *)imageName Action:(SEL)selector{
    UIImage *searchImg=[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:searchImg style:UIBarButtonItemStylePlain target:self action:selector];
}

//右侧导航栏按钮
- (void)setNavigationRightBarBtnItemWithTitle:(NSString *)title ImgName:(NSString *)imageName Action:(SEL)selector{
    if (imageName) {
        UIImage *searchImg=[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:searchImg style:UIBarButtonItemStylePlain target:self action:selector];
    }
    else{
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
    }
    
}

//在 Info.plist 文件中添加 View controller-based status bar appearance 设置为 YES 否则不生效
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.statusBarStyle;
}

- (BOOL)prefersStatusBarHidden {
    return self.statusBarHidden;
}

//statusBar类型设置
- (void)changeStatusBarStyle:(UIStatusBarStyle)statusBarStyle statusBarHidden:(BOOL)statusBarHidden{
    self.statusBarStyle=statusBarStyle;
    self.statusBarHidden=statusBarHidden;
    [self setNeedsStatusBarAppearanceUpdate];
}
/** 需要在RootNavigationVC中添加函数以重写status做统一设置
 - (UIViewController *)childViewControllerForStatusBarStyle{
 return self.topViewController;
 }
 */

//更改statusbar颜色
- (void)changeStatusBarColor:(UIColor *)barColor{
    self.statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -([[UIApplication sharedApplication] statusBarFrame].size.height), self.view.frame.size.width, [[UIApplication sharedApplication] statusBarFrame].size.height)];
    self.statusBarView.backgroundColor = barColor;
    [self.navigationController.navigationBar addSubview:self.statusBarView];
}

//移除statusbar颜色
- (void)removeStatusBarColor{
    [self.statusBarView removeFromSuperview];
}


//初始化tableview（需添加代理）
- (UITableView *)tableViewWithFrame:(CGRect)frame Style:(UITableViewStyle)style{
    _base_tableView=[[UITableView alloc]initWithFrame:frame style:style];
    _base_tableView.showsVerticalScrollIndicator=NO;
    _base_tableView.showsHorizontalScrollIndicator=NO;
    _base_tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _base_tableView.sectionFooterHeight = 0;
    _base_tableView.estimatedRowHeight = 0;
    _base_tableView.estimatedSectionHeaderHeight = 0;
    _base_tableView.estimatedSectionFooterHeight = 0;
    _base_tableView.delegate=self;
    _base_tableView.dataSource=self;
    if (@available(iOS 11.0, *)) {
        if ([self respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]){
            _base_tableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        }
    } else {
        if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _base_tableView;
}


//数据刷新
- (void)refreshData:(NSMutableArray *)dataArray ScrollView:(UIScrollView *)scrollView RefreshFooter:(BOOL)showFooter{
    WS(weakSelf)
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [dataArray removeAllObjects];
        weakSelf.pages = 0;
        weakSelf.totalCount = 0;
        [weakSelf setData];
    }];
    header.automaticallyChangeAlpha = YES;
    scrollView.mj_header=header;
    
    if (showFooter) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            if (weakSelf.totalCount == dataArray.count) {
                scrollView.mj_footer.state = MJRefreshStateNoMoreData;
                return ;
            }
            weakSelf.totalCount = dataArray.count;
            if (dataArray.count == 0) {
                weakSelf.pages = 0;
                [weakSelf setData];
                return;
            }
            weakSelf.pages++;
            [weakSelf setData];
        }];
        [footer setTitle:@"没有更多数据了" forState:MJRefreshStateNoMoreData];
        scrollView.mj_footer=footer;
    }
}

//数据源
- (void)setData{
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
//    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
