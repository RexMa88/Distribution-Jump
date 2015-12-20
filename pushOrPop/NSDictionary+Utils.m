//
//  NSDictionary+Utils.m
//  WeGo
//
//  Created by Rex Ma on 15/12/20.
//  Copyright © 2015年 Rex Ma. All rights reserved.
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary (Utils)

- (BOOL)boolForKey:(id)key{
    id obj = [self objectForKey:key];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]){
        return [obj boolValue];
    }else{
        if (obj) {
            Clog(@"The error key is %@",key);
        }
        return NO;
    }
}

- (int)intForKey:(id)Key{
    id obj = [self objectForKey:Key];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]) {
        return [obj intValue];
    }else{
        if (obj) {
            Clog(@"The error key is %@",Key);
        }
        return 0;
    }
}

- (float)floatForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]) {
        return [obj floatValue];
    }else {
        if (obj) {
            Clog(@"the key %@ of dic is error", aKey);
        }
        return 0;
    }
}

- (long)longForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]) {
        return [obj longValue];
    }else {
        if (obj) {
            Clog(@"the key %@ of dic is error", aKey);
        }
        return 0;
    }
}

- (double)doubleForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]) {
        return [obj doubleValue];
    }else {
        if (obj) {
            Clog(@"the key %@ of dic is error", aKey);
        }
        return 0;
    }
}

- (NSDictionary *)dictionaryForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return obj;
    }else {
        if (obj) {
            Clog(@"the key %@ of dic is error", aKey);
        }
        return nil;
    }
}

- (NSArray *)arrayForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSArray class]]) {
        return obj;
    }else {
        if (obj) {
            Clog(@"the key %@ of dic is error", aKey);
        }
        return nil;
    }
}

- (NSString *)stringForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }else {
        if (obj) {
            Clog(@"the key %@ of dic is error", aKey);
        }
        return nil;
    }
}

- (NSString *)safeStringForKey:(id)aKey {
    NSString *str = [self stringForKey:aKey];
    if (!str) {
        str = @"";
    }
    return str;
}

- (NSString *)numStringForKey:(id)aKey {
    id num = [self objectForKey:aKey];
    if ([num isKindOfClass:[NSNumber class]] || [num isKindOfClass:[NSString class]]) {
        return [num description];
    }else {
        return nil;
    }
}

- (NSDate *)dateForKey:(id)aKey {
    id date = [self objectForKey:aKey];
    if ([date isKindOfClass:[NSDate class]]) {
        return date;
    }else {
        if (date) {
            Clog(@"the key %@ of dic is error", aKey);
        }
        return nil;
    }
}



@end
