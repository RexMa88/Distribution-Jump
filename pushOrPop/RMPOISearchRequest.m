//
//  RMPOISearchRequest.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/23.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMPOISearchRequest.h"

@implementation RMPOISearchRequest

+ (instancetype)shareManager{
    static RMPOISearchRequest *_shareManagerRequest;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManagerRequest = [[RMPOISearchRequest alloc] init];
    });
    
    return _shareManagerRequest;
}

#pragma mark - initialize

- (instancetype)init{
    self = [self initWithLocation:nil keywords:@"咖啡" types:@"餐饮服务"];
    
    if (self) {
        
    }
    
    return self;
}

- (instancetype)initWithLocation:(CLLocation *)location keywords:(NSString *)keywords types:(NSString *)types{
    self = [super init];
    
    if (self) {
        self.location = [AMapGeoPoint locationWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
        self.keywords = [keywords copy];
        self.types = [types copy];
        self.sortrule = 0;//0为距离排序 1为综合排序
        self.requireExtension = YES;//是否返回扩展信息
    }
    
    return self;
}

@end
