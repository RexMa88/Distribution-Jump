//
//  NSDictionary+Utils.h
//  WeGo
//
//  Created by Rex Ma on 15/12/20.
//  Copyright © 2015年 Rex Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Utils)

/**
 *  当没有值或者类型错误时
 */
- (NSString *)safeStringForKey:(id)key;
- (BOOL)boolForKey:(id)key;
- (int)intForKey:(id)Key;
- (float)floatForKey:(id)key;
- (long)longForKey:(id)key;
- (double)doubleForKey:(id)key;
- (NSDictionary *)dictionaryForKey:(id)key;
- (NSArray *)arrayForKey:(id)key;
- (NSString *)stringForKey:(id)aKey;
- (NSDate *)dateForKey:(id)aKey;
- (NSString *)numStringForKey:(id)aKey;

@end
