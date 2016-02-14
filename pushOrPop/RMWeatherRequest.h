//
//  RMWeatherRequest.h
//  pushOrPop
//
//  Created by 马超 on 16/2/13.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

/**
 *  天气网络请求--使用了ReactiveCocoa函数式响应式编程框架
 *  RACSignal信号
 */
//@class RMLocationShareManager;
@class RMWeatherModel;
@interface RMWeatherRequest : NSObject

@property (readonly, nonatomic, strong) CLLocation *currentLocation;
@property (readonly, nonatomic, strong) RMWeatherModel *weatherModel;

+ (instancetype)shareManager;

- (void)findCurrentLocation;

@end
