//
//  ViewController.m
//  JS&OC
//
//  Created by Felix on 2017/12/7.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController () <UIWebViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame: [UIScreen mainScreen].bounds];
    [self.view  addSubview:_webView];
    NSString *httpStr = @"https://www.baidu.com";
    NSURL *httpUrl = [NSURL URLWithString:httpStr];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:httpUrl];
    [_webView loadRequest:httpRequest];
    _webView.delegate = self;
}

//网页加载之前会条用次方法
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}

//开始加载网页时调用此方法
-(void)webViewDidStartLoad:(UIWebView *)webView {
    
}
//网页加载失败时调用
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}
//网页加载完成时调用
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    //创建JSContext对象
    JSContext *jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *alertJS = @"alert('Test js OC')";
    [jsContext evaluateScript:alertJS];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
