//
//  RMWeatherRequest.m
//  pushOrPop
//
//  Created by 马超 on 16/2/13.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMWeatherRequest.h"
#import "RMClient.h"

@interface RMWeatherRequest ()

@property (nonatomic, strong) NSURLSession *session;

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
        
    }
    return self;
}



@end
