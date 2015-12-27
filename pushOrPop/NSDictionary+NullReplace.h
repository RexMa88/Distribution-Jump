//
//  NSDictionary+NullReplace.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/27.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NullReplace)

- (id)objectForKeyNotNull:(NSString *)key;

@end
