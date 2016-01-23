//
//  RMLocationShareManager.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/23.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMLocationShareManager.h"

@implementation RMLocationShareManager

+ (instancetype)shareManager{
    static RMLocationShareManager *_shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[RMLocationShareManager alloc] init];
    });
    
    return _shareManager;
}

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //设置后台定位
        [self setPausesLocationUpdatesAutomatically:NO];
        [self setAllowsBackgroundLocationUpdates:YES];
        [self startUpdatingLocation];
    }
    
    return self;
}

@end
