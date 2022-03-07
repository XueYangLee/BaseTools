//
//  WKWebViewController.m
//  BaseTools
//
//  Created by Singularity on 2019/4/4.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "WKWebViewController.h"

@interface WKWebViewController ()

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.URLString=@"https://www.jianshu.com/u/e0d9441b4d9b";
    
    WeakBaseWebViewScriptMessageDelegate *weakScriptMessageDelegate = [[WeakBaseWebViewScriptMessageDelegate alloc] initWithDelegate:self];
    [self.config.userContentController addScriptMessageHandler:weakScriptMessageDelegate name:@"webConsult"];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    DLog(@"name:%@\\\\n body:%@\\\\n frameInfo:%@\\\\n",message.name,message.body,message.frameInfo);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    DLog(@"%@>>>>>>>>>>>>>结束导航时>.",webView.URL);
    //一定要加''
    [self.wkWebView evaluateJavaScript:[NSString stringWithFormat:@"webToken('%@')",@"token"] completionHandler:^(id _Nullable data, NSError * _Nullable error) {}];
    
}

- (void)dealloc{
    [[self.wkWebView configuration].userContentController removeScriptMessageHandlerForName:@"webConsult"];
}

@end
