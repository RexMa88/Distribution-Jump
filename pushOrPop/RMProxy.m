//
//  RMProxy.m
//  pushOrPop
//
//  Created by 马超 on 16/2/1.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMProxy.h"
#import <objc/runtime.h>

@implementation RMProxy

- (instancetype)initWithTarget:(id)target{
    _target = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target{
    return [[RMProxy alloc] initWithTarget:target];
}

- (id)forwardingTargetForSelector:(SEL)selector {
    return _target;
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    void *null = NULL;
    [invocation setReturnValue:null];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [NSObject instanceMethodSignatureForSelector:sel];
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [_target respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object{
    return [_target isEqual:object];
}

@end
