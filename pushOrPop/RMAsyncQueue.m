//
//  RMAsyncQueue.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/29.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMAsyncQueue.h"

static const char queueTagKey;

void RMQueue(dispatch_queue_t q){
    dispatch_queue_set_specific(q, &queueTagKey, (__bridge void*)q, NULL);
}

dispatch_queue_t RMCreateQueue(const char *label,
                               dispatch_queue_attr_t attr){
    dispatch_queue_t q = dispatch_queue_create(label, attr);
    RMQueue(q);
    return q;
}
