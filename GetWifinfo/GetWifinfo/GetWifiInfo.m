//
//  GetWifiInfo.m
//  GetWifinfo
//
//  Created by Felix on 2017/11/27.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import "GetWifiInfo.h"
#import <SystemConfiguration/CaptiveNetwork.h>
@implementation GetWifiInfo

-(NSDictionary *)getWifiInfo {
    id info = nil;
    NSString *wifiName;
    NSString *macAddress;
    NSString *ssidData;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();//获取网络接口
    for (NSString *ifname in ifs) {
        info = (__bridge_transfer id) CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifname);//根据网络接口获取当前网络的信息
        wifiName = info[@"SSID"];//Service Set Identifier
        macAddress = info[@"BSSID"];//MAC地址
        ssidData = [[NSString alloc]initWithData:info[@"SSIDDATA"] encoding:NSUTF8StringEncoding];
    }
    NSDictionary *wifiDic = [NSDictionary dictionaryWithObjectsAndKeys:wifiName,@"name",macAddress,@"macAddress",ssidData,@"ssiddata", nil];
    return wifiDic;
}

@end
