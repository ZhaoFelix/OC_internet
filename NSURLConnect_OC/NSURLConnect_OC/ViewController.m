//
//  ViewController.m
//  NSURLConnect_OC
//
//  Created by Felix on 2017/11/15.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"连接数据" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)pressBtn{
    NSString* strURL = @"http://www.baidu.com";
    //将字符串转换为链接对象
    NSURL* url = [NSURL URLWithString:strURL];
    //定义一个连接请求对象
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    //创建一个网络连接对象
    //参数一：请求对象
    //参数二：代理对象
    _connection  = [NSURLConnection connectionWithRequest:request delegate:self];
}
//处理连接错误的代理协议
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@",error);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
