//
//  ViewController.m
//  GetWifinfo
//
//  Created by Felix on 2017/11/26.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "ViewController.h"
#import "GetWifiInfo.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize wifiName=_wifiName;
@synthesize  wifiIP = _wifiIP;
- (void)viewDidLoad {
    [super viewDidLoad];
    _wifiName = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:_wifiName];
    
    
    _wifiIP = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    [self.view addSubview:_wifiIP];
    
    GetWifiInfo *getWifiInfo = [[GetWifiInfo alloc]init];
    NSDictionary *infoDic = [getWifiInfo getWifiInfo];
    NSLog(@"%@",infoDic);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
