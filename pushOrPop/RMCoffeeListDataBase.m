//
//  RMCoffeeListDataBase.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/28.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMCoffeeListDataBase.h"
#import "FMDB.h"
#import <objc/runtime.h>

@implementation RMCoffeeListDataBase

- (BOOL)executeOperation:(NSString *)operation
                    name:(NSString *)name
                    data:(NSDictionary *)dict{
    
    NSString *operationStr = [self filterOperation:operation];
    
    //对错误操作符进行排查
    if (!operation) return NO;
    
    NSString *sql = [self SqlGenerateWithOperation:operationStr
                                             table:name
                                              dict:dict];
    
    
    
    //数据库操作
    BOOL isSuccess = [self operationSql:sql
                              operation:operationStr
                                   dict:dict];
    
    
    return YES;
}

//过滤Operation操作
- (NSString *)filterOperation:(NSString *)operation{
    NSString *oper = [operation substringToIndex:6];
    if ([[oper uppercaseString] isEqualToString:SELECT]) return SELECT;
    if ([[operation uppercaseString] isEqualToString:@"INSERT"]) return @"INSERT INTO";
    if ([[operation uppercaseString] isEqualToString:DELETE]) return DELETE;
    else return nil;
}

/**
 *  The Sql of operation database
 *
 *  @param operationStr operation
 *  @param name         The name of table
 *  @param dict         The key and value you wanna operate
 *
 *  @return The sql
 */

- (NSString *)SqlGenerateWithOperation:(NSString * _Nonnull)operationStr
                                 table:(NSString * _Nonnull)name
                                  dict:(NSDictionary *)dict{
    //获取data的keys和values
    NSArray *allKeys = [dict allKeys];
    //插入操作
//    NSArray *allValues = [dict allValues];
    
    NSMutableString *sql = [[NSMutableString alloc] init];
    [sql appendString:operationStr];
    
    //判断是否为查询操作
    if ([operationStr isEqualToString:@"SELECT"]) {
        [allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            [sql appendFormat:@" %@,",key];
        }];
        [sql replaceCharactersInRange:NSMakeRange(sql.length - 1, 1) withString:@" "];
        [sql appendFormat:@"FROM %@", name];
    }
    
    //判断是否为插入操作
    if ([operationStr isEqualToString:@"INSERT INTO"]) {
        //插入表名称
        [sql appendFormat:@" %@ ",name];
        //顺便把值字符串也拼接好 VALUES (?, ?, ?,....)
        NSMutableString *valueSql = [[NSMutableString alloc] initWithString: @"VALUES "];
        
        //判断是否只插入一个值
        if (allKeys.count == 1) [sql appendFormat:@"(%@) VALUES (?)",[allKeys firstObject]];
        else{
            [allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
                //判断是否是第一个插入数值，如果是，请添加左括号
                if (idx == 0){
                    [sql appendFormat:@"(%@,",key];
                    [valueSql appendString:@"(?,"];
                }
                //判断是否是最后一个插入数值，如果是，请添加右括号
                else if (idx == allKeys.count - 1) {
                    [sql appendFormat:@" %@) ",key];
                    [valueSql appendString:@" ?)"];
                }
                //中间插入数值处理
                else{
                    [sql appendFormat:@" %@,",key];
                    [sql appendString:@" ?"];
                }
            }];
            
            //拼接sql
            [sql appendFormat:@"%@",valueSql];
        }
    }
    
    //判断是否为删除
    
    return sql;
}

- (BOOL)operationSql:(NSString *)sql
           operation:(NSString *)operation
                dict:(NSDictionary *)dict{
    
    [self open];
    
    if ([operation isEqualToString:SELECT]) {
        FMResultSet *result = [self executeQuery:sql];
        while ([result next]) {
            
        }
    }
    
    return YES;
}

@end
