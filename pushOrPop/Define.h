//
//  Define.h
//  pushOrPop
//
//  Created by RexMa on 15/11/26.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#ifndef Define_h
#define Define_h

//控制器宏 TabControllerType
//Warning: 顺序不可以改变
typedef NS_ENUM(NSUInteger, TabControllerType) {
    TabControllerTypeCoffee     = 0,//咖啡
    TabControllerTypeWeather    = 1,//天气
};

//高德地图APIKey
#define AMapAPIKey                                  @"d1bda35e7fc6d5c2db2c47732d5eaf66"
//OpenWeatherAPI
#define OpenWeatherAPIKey      @"73ec249c9ff6c666bad9cc9ebfb3f8dc"
//跳转界面参数
#define kDictionaryKeyAnimated                      @"animated"
#define kDictionaryKeyClass                         @"class"
#define kDictionaryKeySelector                      @"selector"
#define kDictionaryKeyObject                        @"object"
#define kDictionaryKeySelectorBackground            @"backgroundRun"
#define kDictionaryKeyAnotherSelector               @"anoterSelector"
#define kDictionaryKeyAnotherObject                 @"anotherObject"
#define kDictionaryKeyAnotherSelectorBackground     @"anotherbackgroundRun"
//显示高度与宽度
#define kWidth                              [[UIScreen mainScreen] bounds].size.width
#define kHeight                             [[UIScreen mainScreen] bounds].size.height
#define kScreenBounds                       [UIScreen mainScreen].bounds
#define kNavigationBarHeight                44.0f
#define kNavigationAndStatusBarHeight       64.0f
//The Key of dataDict
#define kDataArrayKey                       @"dataArrayKey"
#define kTableViewDataKey                   @"tableViewDataKey"
//The key of TableViewCell ReuseIdentifier
#define kTableViewReuseIdentifier           @"TableViewReuseIdentifier"
#define kTableViewCellStr                   @"TableViewCell"

#endif /* Define_h */
