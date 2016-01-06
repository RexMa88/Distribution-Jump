//
//  RMDateShareManager.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/6.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMDateShareManager.h"

@implementation RMDateShareManager

+ (instancetype)shareManager{
    static RMDateShareManager *_shareManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[RMDateShareManager alloc] init];
    });
    
    return _shareManager;
}

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //设置时区
        NSTimeZone *timeZone = [NSTimeZone localTimeZone];
        //设置NSDateFormatter
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:timeZone];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        //默认当前日期
        NSString *dateStr = [dateFormatter stringFromDate:[NSDate date]];
        self.date = [dateFormatter dateFromString:dateStr];
    }
    return self;
}



@end
