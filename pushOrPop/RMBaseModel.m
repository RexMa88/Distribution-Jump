//
//  RMBaseModel.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/27.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMBaseModel.h"

@implementation RMBaseModel

- (NSString * )description{
    NSMutableString *value = [[NSMutableString alloc] init];
    
    [self.propertyList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [value appendFormat:@"%@:%@,\n",obj,[self valueForKey:obj]];
    }];
    return [NSString stringWithFormat:@"%s:%p:\n%@",class_getName([self class]),self,value];
}

@end

@implementation NSObject (DictionaryToModel)

- (id)initWithDic:(NSDictionary *)dict{
    if ([dict isKindOfClass:[NSDictionary class]]) {
        [self.propertyList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (dict[obj] == nil || [dict[obj] isKindOfClass:[NSNull class]]) [self setValue:@"" forKey:obj];
            else [self setValue:[dict objectForKeyNotNull:obj] forKey:obj];
        }];
    }
    return [self init];
}
/**
 *  通过runtime获取属性列表
 *
 *  @return (NSArray)属性列表
 */
-(NSArray *)propertyList
{
    unsigned int propertyCount;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    objc_property_t *property_t = class_copyPropertyList([self class], &propertyCount);
    
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t item = property_t[i];
        const char *tmp = property_getName(item);
        [array addObject:[NSString stringWithCString:tmp encoding:NSUTF8StringEncoding]];
    }
    free(property_t);
    return array;
}

- (void)changeValuesWithDic:(NSDictionary *)dict{
    [self.propertyList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (dict[obj] == nil) [self setValue:@"" forKey:obj];
        else [self setValue:[dict objectForKeyNotNull:obj] forKey:obj];
    }];
}

@end
