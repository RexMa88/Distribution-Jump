//
//  RMCoffeeListDataBase.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/28.
//  Copyright © 2016年 RexMa. All rights reserved.
//


/*
 *  对FMDB进行再封装，防止SQL语句的错误带来的问题
 */

#import "FMDatabase.h"

NS_ASSUME_NONNULL_BEGIN

@interface RMCoffeeListDataBase : FMDatabase

//操作数据库封装，name格式：db或sqlite
- (BOOL)executeDataBase:(NSString *)operation
                   name:(NSString *)name
                   data:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END