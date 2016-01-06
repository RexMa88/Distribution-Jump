//
//  RMDateShareManager.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/6.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMDateShareManager : NSObject

@property (nonatomic, strong) NSDate *date;

+ (instancetype)shareManager;

@end
