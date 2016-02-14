//
//  RMClient.h
//  pushOrPop
//
//  Created by 马超 on 16/2/14.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>
@import CoreLocation;

@interface RMClient : NSObject

- (RACSignal *)fetchDataFromURL:(NSURL *)url;
- (RACSignal *)fetchLocalWeatherForLocation:(CLLocationCoordinate2D)coordinate;

@end
