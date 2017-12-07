//
//  ViewController.m
//  OC&JS
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
    [self.view addSubview:_webView];
    _webView.delegate = self;
    NSString *httpStr = @"https://www.baidu.com";
    NSURL *httpUrl = [NSURL URLWithString:httpStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:httpUrl];
    [_webView loadRequest:request];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    JSContext *jsContext = [_webView valueForKey:@"documentView.webView.mainFrame.javaScriptContext"];
    //js条用oc
    //第一种情况
    jsContext[@"test"] = ^() {
        NSArray *array = [JSContext currentArguments];
        for (id obj in array) {
            NSLog(@"%@",obj);
        }
    };
    
    //
    NSString *jsFuncStr = @"test('参数1')";
    [jsContext evaluateScript:jsFuncStr];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
