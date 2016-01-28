//
//  RMCoffeeListDataBase.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/28.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMCoffeeListDataBase.h"

@implementation RMCoffeeListDataBase

+ (instancetype)shareManager{
    static RMCoffeeListDataBase *_shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[RMCoffeeListDataBase alloc] init];
    });
    
    return _shareManager;
}

- (instancetype)init{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (NSString *)databasePath{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"coffee.sqlite"];
    return path;
}

@end
