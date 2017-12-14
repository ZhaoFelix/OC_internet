//
//  ViewController.m
//  ParseJSON
//
//  Created by Felix on 2017/12/14.
//  Copyright © 2017年 Felix. All rights reserved.
//


/*
JSON数据（NSData） -> 对象 （foundation Object）
 {} -> NSDictionary
 [] -> NSArray
 "string" -> NSString
 10 -> NSNumber
 true -> NSNumber 1
 false -> NSNumber 0
 
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *json = @"{\"rich\":true}";
    NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil]);
    /*
     iOS中json解析方法
     JSONKit
     SBJSON
     TouchJSON
     NSJsonSerialization(苹果原生，性能最好)
     */
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *str = @"http://baike.baidu.com/api/openapi/BaikeLemmaCardApi?scope=103&format=json&appid=379020&bk_key=IT&bk_length=600";
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse *response,NSData *data,NSError *error){
        NSString *jsonStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
       //解析json数据
        
        /*
         参数二：
         NSJSONReadingMutableContainers = (1UL << 0)//创建出来的字典数组是可变的
         NSJSONReadingMutableLeaves = (1UL << 1)//数组里面的字符串也是可变的
         NSJSONReadingAllowFragments = (1UL << 2)//允许解析出来的对象不是字典或数组
         */
        NSDictionary *dic  =  [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        //将字典写成.plist文件保存在桌面
         //[dic writeToFile:@"/Users/Felix/Desktop/test.plist" atomically:YES];
        //获取json数据中的内容
        NSArray *contents = dic[@"abstract"];
        NSLog(@"%@",contents);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
