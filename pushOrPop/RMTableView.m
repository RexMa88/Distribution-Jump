//
//  RMTableView.m
//  pushOrPop
//
//  Created by 马超 on 16/2/2.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMTableView.h"

@implementation RMTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delaysContentTouches = NO;
        self.canCancelContentTouches = YES;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        //remove delay touch since iOS 8
        UIView *wrapView = self.subviews.firstObject;
        if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
            for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
                if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                    gesture.enabled = NO;
                    break;
                }
            }
        }
        
    }
    
    return self;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view{
    if ([view isKindOfClass:[UIControl class]]) {
        return YES;
    }else return [super touchesShouldCancelInContentView:view];
}

@end
