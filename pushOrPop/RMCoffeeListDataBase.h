//
//  RMCoffeeListDataBase.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/28.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "FMDatabase.h"

NS_ASSUME_NONNULL_BEGIN

@interface RMCoffeeListDataBase : FMDatabase

+ (instancetype)shareManager;

@end

NS_ASSUME_NONNULL_END