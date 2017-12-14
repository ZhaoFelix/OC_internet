//
//  ViewController.m
//  DownloadFile
//
//  Created by Felix on 2017/12/14.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>
//文件数据
@property (nonatomic,strong) NSMutableData *fileData;
//文件长度
@property (nonatomic,assign) NSInteger *fileLength;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://img.bedeveloper.cn/1508865815426"];
    //使用connection进行文件下载
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:url] delegate:self];
    
    //该方法只能下载小文件，无法进行断点下载
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //NSLog(@"%lu",(unsigned long)data.length);
  
}

//NSURLConnectionDataDelegate代理需要实现的几个方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response {
   //接收到响应时调用该方法
    self.fileLength = [response.allHeaderFields[@"Content-Length"] integerValue];
    self.fileData = [NSMutableData data];
    //NSLog(@"%@",response);
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //接收到数据时开始调用
    [self.fileData appendData:data];
   
    NSLog(@"------%f-------",self.fileData.length);
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //下载完毕时调用
    //将文件写入沙盒中，在iOS中不允许将文件写入document
    // 缓存的文件路径
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //文件路径
    NSString *file = [cache stringByAppendingPathComponent:@"1508865815426.png"];
   //写入数据
    [self.fileData writeToFile:file atomically:YES];
    self.fileData = nil;
    NSLog(@"%@",file);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
