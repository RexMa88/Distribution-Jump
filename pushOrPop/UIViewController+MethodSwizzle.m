//
//  UIViewController+MethodSwizzle.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/10.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "UIViewController+MethodSwizzle.h"
#import <objc/runtime.h>

typedef void (*_VIMP)(id,SEL,...);//无返回类型
typedef id (*_IMP) (id,SEL,...);//有返回类型

@implementation UIViewController (MethodSwizzle)

+ (void)load{
    //利用dispatch_once_t保证只交换一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //获取到ViewDidLoad
        Method viewDidLoad =class_getClassMethod(self, @selector(viewDidLoad));
        //使用VIMP,因为无返回值
        _VIMP ViewDidLoad_VIMP = (_VIMP)method_getImplementation(viewDidLoad);
        //替换ViewDidLoad中的实现
        method_setImplementation(viewDidLoad, imp_implementationWithBlock(^(id target,SEL action){
            ViewDidLoad_VIMP(target, action);
        }));
    });
}

@end
