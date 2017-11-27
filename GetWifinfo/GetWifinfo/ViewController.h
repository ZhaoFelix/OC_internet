//
//  ViewController.h
//  GetWifinfo
//
//  Created by Felix on 2017/11/26.
//  Copyright © 2017年 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UILabel *_wifiName;
    UILabel *_wifiIP;
}
@property (retain,nonatomic) UILabel *wifiName;
@property (retain,nonatomic) UILabel *wifiIP;
@end

