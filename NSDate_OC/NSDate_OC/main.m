//
//  main.m
//  NSDate_OC
//
//  Created by Felix on 2017/11/18.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate* now = [NSDate  date];//获取当前时间
        //时间的计算
        NSDate* myDate = [now dateByAddingTimeInterval:16*60*60];//时间计算单位是秒
        //计算时间间隔
        NSTimeInterval interval = [myDate timeIntervalSinceDate:now];
        /*一般用来设置无限长的时间*/
        //很久很久以前
        [NSDate distantPast];
        //很久很久以后
        [NSDate distantFuture];
        
        //时间格式
        /*
         Y 年
         M 月
         D 日
         H 24小时制
         h 12 小时制
         m 分
         s 秒
         
         */
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat: @"hh时mm分ss秒"];
        NSString* dateStrig = [dateFormatter stringFromDate:now];
        NSLog(@"dateString:%@",dateStrig);//dateString:10时59分38秒
        
        NSLog(@"%g",interval);
        NSLog(@"%@",myDate);
    }
    return 0;
}
