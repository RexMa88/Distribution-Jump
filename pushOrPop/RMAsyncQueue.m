//
//  RMAsyncQueue.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/29.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMAsyncQueue.h"

static const char queueTagKey;

/**
 *  利用队列关联数据的方式存储队列
 *
 *  @param q dispatch_queue_t 存储的队列
 */
void RMQueue(dispatch_queue_t q){
    dispatch_queue_set_specific(q, &queueTagKey, (__bridge void*)q, NULL);
}



/**
 *  比较便捷地创造一个自定义队列
 *
 *  @param label 自定义队列的标记 flag
 *  @param attr  自定义队列的属性（并行、串行）DISPATCH_QUEUE_SERIAL || DISPATCH_QUEUE_CONCURRENT
 *
 *  @return 自定义队列 custom dispatch_queue_t
 */
dispatch_queue_t RMCreateQueue(const char *label,
                               dispatch_queue_attr_t attr){
    dispatch_queue_t q = dispatch_queue_create(label, attr);
    RMQueue(q);
    return q;
}

BOOL RMQueueCurrentIsTaggedQueue(dispatch_queue_t q){
    return (RMQueueGetCurrentTagged() == q);
}

dispatch_queue_t RMQueueGetCurrentTagged(){
    return (__bridge dispatch_queue_t)dispatch_get_specific(&queueTagKey);
}

BOOL RMQueueCurrentIsMainQueue(){
    return [NSThread isMainThread];
}

void RMQueueSafeDispatchSync(dispatch_queue_t q, dispatch_block_t block){
    if (RMQueueCurrentIsTaggedQueue(q)) block();
    else dispatch_sync(q, block);
}