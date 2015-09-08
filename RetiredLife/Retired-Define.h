//
//  Retired-Define.h
//  RetiredLife
//
//  Created by Water on 15/9/4.
//  Copyright (c) 2015年 Water. All rights reserved.
//
#import "IDInfoViewController.h"
#import "IndexView.h"
#import "InfoTableView.h"
#import "PPiFlatSegmentedControl.h"
#import "CustomTitleView.h"
#import "PersonalViewController.h"
#import "UIViewExt.h"
#ifndef RetiredLife_Retired_Define_h
#define RetiredLife_Retired_Define_h
#define IMAGE(_name) [UIImage imageNamed:_name]

#define TOOLBAR_HEIGHT      (44.0f)
#define STATUSBAR_HEIGHT    ([UIApplication sharedApplication].statusBarFrame.size.height)
#define NAVBAR_HEIGHT       (49.0F)

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//获取app屏幕方向
#define MOBIINTERFACE [[UIApplication sharedApplication] statusBarOrientation]

//获取横屏 宽 高
#define MAIN_SCREEN_WIDTH ((!IOS_VERSION_8_OR_ABOVE && MOBIINTERFACE != UIInterfaceOrientationPortrait )? SCREEN_HEIGHT:SCREEN_WIDTH)
#define MAIN_SCREEN_HEIGHT ((!IOS_VERSION_8_OR_ABOVE && MOBIINTERFACE != UIInterfaceOrientationPortrait )? SCREEN_WIDTH:SCREEN_HEIGHT)
#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))
#define IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))
#define IOS_VERSION_7_OR_BELOW (([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)? (YES):(NO))
#endif
