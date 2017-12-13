//
//  ViewController.m
//  Get&Post
//
//  Created by Felix on 2017/12/13.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)internetRequest{
    
    /*
     get与post的区别
     get的参数在链接中
     post的参数在请求体中
     */
    NSString *str = @"";//请求的链接地址
    //当链接中出现中文时，需要对字符串进行编码解析
    str =  [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:str];
    //创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //设置请求的方法
    request.HTTPMethod = @"GET";//默认是get请求
    //设置请求体
    request.HTTPBody = [@"name=zhangsan" dataUsingEncoding:NSUTF8StringEncoding];
    
    /*
     iOS中发送请求的方式
     NSURLConnection
     NSURLSession
     CFNetwork
     ASI
     AFN
     */
    
    //发送请求
    
    
    //发送同步请求
//    [NSURLConnection sendSynchronousRequest:<#(nonnull NSURLRequest *)#> returningResponse:<#(NSURLResponse *__autoreleasing  _Nullable * _Nullable)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>];
    //发送异步请求
   //[NSURLConnection sendAsynchronousRequest:<#(nonnull NSURLRequest *)#> queue:<#(nonnull NSOperationQueue *)#> completionHandler:<#^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError)handler#>]
    
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
