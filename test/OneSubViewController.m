//
//  OneSubViewController.m
//  test
//
//  Created by 李洞洞 on 7/11/17.
//  Copyright © 2017年 Minte. All rights reserved.
//
#import "OneSubViewController.h"
#import<WebKit/WebKit.h>
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface OneSubViewController ()<WKNavigationDelegate>
@property(nonatomic,strong)WKWebView * webView;
@end
@implementation OneSubViewController

- (WKWebView *)webView
{
    if (!_webView) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 0)];
        _webView.backgroundColor = [UIColor lightGrayColor];
        _webView.navigationDelegate = self;
        [_webView setOpaque:NO];
    }
    return _webView;
}
- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    
    
    NSLog(@"%@-----%@",NSStringFromCGRect(_webView.frame),NSStringFromCGRect(self.view.frame));
}


























- (void)dealloc
{
    NSLog(@"%s",__func__);
#if 0
        NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
        [self.view addSubview:self.webView];
        [self.webView loadRequest:request];
#endif
}
@end
