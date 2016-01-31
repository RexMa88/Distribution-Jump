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

/**
 *  数据库操作的封装
 *
 *  @param operation SELECT、INSERT、DELETE
 *  @param name      The name of TABLE 表名
 *  @param dict      The key of database you wanna search 你想要查询或者插入的键值
 *
 *  @return 操作数据库是否成功
 */

- (BOOL)executeOperation:(NSString *)operation
                    name:(NSString *)name
                    data:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END