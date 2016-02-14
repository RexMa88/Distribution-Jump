//
//  RMWeatherRequest.m
//  pushOrPop
//
//  Created by 马超 on 16/2/13.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMWeatherRequest.h"
#import "RMClient.h"
#import "RMLocationShareManager.h"
#import "RMWeatherModel.h"

@interface RMWeatherRequest ()<AMapLocationManagerDelegate>

@property (readwrite, nonatomic, strong) CLLocation *currentLocation;
@property (readwrite, nonatomic, strong) RMWeatherModel *weatherModel;
@property (nonatomic, strong) RMClient *client;

@end

@implementation RMWeatherRequest

+ (instancetype)shareManager{
    static RMWeatherRequest *_shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[RMWeatherRequest alloc] init];
    });
    
    return _shareManager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _client = [[RMClient alloc] init];
        [[RMLocationShareManager shareManager] setDelegate:self];
        //RACObserver
        [[[[RACObserve(self, currentLocation)
         ignore:nil]
         flattenMap:^(CLLocation *newLocation) {
             return [RACSignal merge:@[[self updateCurrentLocation]]];
         }] deliverOn:RACScheduler.mainThreadScheduler]
         subscribeError:^(NSError *error) {
             NSLog(@"The error is %@",error);
         }];
    }
    return self;
}

#pragma mark - AMapLocationManagerDelegate

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location{
    self.currentLocation = location;
    [[RMLocationShareManager shareManager] stopUpdatingLocation];
}

- (void)findCurrentLocation{
    [[RMLocationShareManager shareManager] startUpdatingLocation];
}

#pragma mark - Custom Method

- (RACSignal *)updateCurrentLocation{
    return [[self.client fetchLocalWeatherForLocation:self.currentLocation.coordinate] doNext:^(RMWeatherModel *weatherModel) {
        self.weatherModel = weatherModel;
    }];
}

@end
