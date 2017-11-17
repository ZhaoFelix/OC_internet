//
//  ViewController.h
//  NSURLConnect_OC
//
//  Created by Felix on 2017/11/15.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
//普通的代理协议
NSURLConnectionDelegate,
//数据代理协议
NSURLSessionDataDelegate
>
{
    //定义一个连接对象
    NSURLConnection* _connection;
    
    //创建一个可变的二进制数据对象，接收服务器传回的数据
    NSMutableData* _data;
}
@end

