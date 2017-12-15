//
//  ViewController.m
//  DownloadFiIe02
//
//  Created by Felix on 2017/12/14.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>
//文件总长度
@property (nonatomic,assign) NSInteger *filelength;
//文件路径
@property (nonatomic,assign)NSString *cacheFile;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //缓存文件夹
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //文件路径
    _cacheFile = [cache stringByAppendingPathComponent:@"test.png"];
    NSURL *url = [NSURL URLWithString:@"http://img.bedeveloper.cn/1508888893062"];
    [NSURLConnection connectionWithRequest:url delegate:self];
}
//接收响应的时候，创建一个空的文件
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response {
    self.filelength = [response.allHeaderFields[@"Content-Length"] integerValue];
    
    
    //创建一个空的文件
    [[NSFileManager defaultManager] createFileAtPath:_cacheFile contents:nil attributes:nil];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSFileHandle *filehandle = [NSFileHandle fileHandleForReadingAtPath:_cacheFile];
    //写入数据
    [filehandle writeData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"---下载成功----");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
