//
//  ViewController.m
//  NSURLSession_Download_File
//
//  Created by Felix on 2017/12/16.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDownloadDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self download];
}
-(void)download {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc]init]];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:[NSURL URLWithString:@"http://img.bedeveloper.cn/1508865815426"]];
    [task resume];
}
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
//    NSLog(@"%s",__func__);
}

/*
 下载完成时调用
 */
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
//     NSLog(@"%s",__func__);
    
    //文件的真实路径
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent: downloadTask.response.suggestedFilename];
    //文件移动
    NSFileManager *filemanager = [NSFileManager defaultManager];
    [filemanager moveItemAtPath:location toPath:[NSURL URLWithString:file] error:nil];
    
}

/*
 断点下载时调用该函数
 */
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
//     NSLog(@"%s",__func__);
    
}

/*
 每次写入临时数据时调用该方法
 totalBytesExpectedToWrite:文件的总大小
 totalBytesWritten:已写入的大小
 
 */
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    // NSLog(@"%s",__func__);
    NSLog(@"------%f",1.0*totalBytesWritten/totalBytesExpectedToWrite);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
