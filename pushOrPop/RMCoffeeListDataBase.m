//
//  RMCoffeeListDataBase.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/28.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMCoffeeListDataBase.h"

@implementation RMCoffeeListDataBase

- (BOOL)executeDataBase:(NSString *)operation
                   name:(NSString *)name
                   data:(NSDictionary *)dict{
    
    NSString *operationStr = [self filterOperation:operation];
    
    //获取data的keys和values
    NSArray *allKeys = [dict allKeys];
    NSArray *allValues = [dict allValues];
    
    NSMutableString *sql = [[NSMutableString alloc] init];
    [sql appendString:operationStr];
    
    if ([operationStr isEqualToString:@"SELECT"]) {
        [allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            [sql appendFormat:@" %@,",key];
        }];
        [sql replaceCharactersInRange:NSMakeRange(sql.length - 1, 1) withString:@" "];
        [sql appendFormat:@"FROM %@", name];
    }
    
    
    
    return YES;
}

//过滤Operation操作
- (NSString *)filterOperation:(NSString *)operation{
    if ([operation hasPrefix:@"SELECT"] || [operation hasPrefix:@"select"]) return @"SELECT";
    if ([operation hasPrefix:@"INSERT"] || [operation hasPrefix:@"insert"]) return @"INSERT INTO";
    if ([operation hasPrefix:@"DELETE"] || [operation hasPrefix:@"delete"]) return @"DELETE";
    else return nil;
}

@end
