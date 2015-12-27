//
//  NSDictionary+NullReplace.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/27.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "NSDictionary+NullReplace.h"

@implementation NSDictionary (NullReplace)

- (id)objectForKeyNotNull:(NSString *)key{
    if ([self isKindOfClass:[NSString class]]) return nil;
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSArray class]] ||
        [object isKindOfClass:[NSNumber class]] ||
        [object isKindOfClass:[NSArray class]] ||
        [object isKindOfClass:[NSDictionary class]]) return object;
    
    return nil;
}

@end
