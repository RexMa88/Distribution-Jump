//
//  RMProxy.h
//  pushOrPop
//
//  Created by 马超 on 16/2/1.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RMProxy : NSProxy

/**
 *  A proxy used to hold a weak object
 *  It can be used to avoid retain cycles, such as the target in NSTimer or CADisplayLink.
 */

@property (nonatomic, weak, readonly) id target;

- (instancetype)initWithTarget:(id)target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END