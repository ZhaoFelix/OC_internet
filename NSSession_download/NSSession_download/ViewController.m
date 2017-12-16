//
//  ViewController.m
//  NSSession_download
//
//  Created by Felix on 2017/12/16.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downdload];
}
-(void)downdload {
    NSURLSession *session = [NSURLSession sharedSession];
    //创建下载任务
    NSURLSessionDataTask *task =  [session downloadTaskWithURL:[NSURL URLWithString:@"http://img.bedeveloper.cn/1508865830245"] completionHandler:^(NSURL *location,NSURLResponse *response,NSError *error){
        NSLog(@"%@",location);
        /*/Users/Felix/Library/Developer/CoreSimulator/Devices/3C9B0431-DA4C-4DE9-8B90-E55C3B992588/data/Containers/Data/Application/A9BA28F0-1C2D-4731-813C-1180E87563AE/tmp/CFNetworkDownload_dkOCZn.tmp
         默认情况下文件被下载到临时的文件夹中
         */
        //文件移动
        NSFileManager *filemanager = [NSFileManager defaultManager];
        NSString *deURL = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:response.suggestedFilename];
        [filemanager moveItemAtURL:location toURL:[NSURL URLWithString:deURL] error:nil];
        
        NSLog(@"文件下载完毕");
    }];
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
