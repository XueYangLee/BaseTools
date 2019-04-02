//
//  BaseWebViewController.h
//  PartScan
//
//  Created by 李雪阳 on 2018/2/26.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>

@interface BaseWebViewController : BaseViewController<WKNavigationDelegate, WKUIDelegate>

/** webView */
@property (nonatomic, strong) WKWebView *wkWebView;
/** 顶部进度条 */
@property (nonatomic, strong) UIProgressView *progressView;

/** 进度条颜色(默认绿色) */
- (void)setProgressColor:(UIColor *)progressColor;

/** wkWeb自定义frame */
- (void)wkWebViewFrame:(CGRect)frame;
/** 加载 web */
- (void)loadRequest:(NSURLRequest *)request;
/** 加载 HTML */
- (void)loadHTMLString:(NSString *)HTMLString;

/** 清除web缓存 */
- (void)removeWebCache;

@end
