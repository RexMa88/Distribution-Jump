//
//  RMHistoricalWeatherRequest.h
//  pushOrPop
//
//  Created by 马超 on 16/2/22.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

/**
 *  获取该地区历史天气记录请求
 */

@interface RMHistoricalWeatherRequest : NSObject

@property (nonatomic, strong, readonly) CLLocation *currentLocation;
@property (nonatomic, copy, readonly) NSArray *historicalWeatherArray;

+ (instancetype)shareManager;

- (void)findCurrentLocation;

@end
