//
//  ViewController.m
//  NSURLSession_data_delegate
//
//  Created by Felix on 2017/12/16.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc]init]];
                             
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://img.bedeveloper.cn/1508865815426"]] completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
//    }];
                             
    //该方法需要配置session的代理
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"http://img.bedeveloper.cn/1508865815426"]];
    [task resume];
}

//代理方法
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler; {
    //接收到服务器响应式调用
    NSLog(@"%s",__func__);
    //如果响应没有问题，将调用数据接收函数
    /*
     NSURLSessionResponseCancel = 0, 默认值，取消响应处理
    NSURLSessionResponseAllow = 1,  处理响应
    NSURLSessionResponseBecomeDownload = 2, 将响应变为下载
     */
    completionHandler(NSURLSessionResponseAllow);
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    //接收到数据时调用
     NSLog(@"%s",__func__);
}
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    //请求成功或失败是调用，如果失败error有值
     NSLog(@"%s",__func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
