//
//  ViewController.m
//  NSURLSession
//
//  Created by Felix on 2017/12/15.
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self post];
}
-(void)post {
    //创建session对象
    NSURLSession *sesion = [NSURLSession sharedSession];
    //创建任务
    NSMutableURLRequest *request =  [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://img.bedeveloper.cn/1508888893062"]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"usename=Felix" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionTask *task = [sesion dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
            NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
        }];
    
    //启动任务
    [task resume];
}
-(void)get {
    //创建session对象
    NSURLSession *sesion = [NSURLSession sharedSession];
    //    //创建任务
    //    NSURLSessionTask *task = [sesion dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://img.bedeveloper.cn/1508888893062"]] completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
    //        NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    //    }];
    
    /*第二种方法*/
    NSURLSessionTask *task = [sesion dataTaskWithURL:[NSURL URLWithString:@"http://img.bedeveloper.cn/1508888893062"] completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    //启动任务
    [task resume];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
