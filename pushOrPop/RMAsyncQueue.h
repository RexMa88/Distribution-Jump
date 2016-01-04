//
//  RMAsyncQueue.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/29.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

//创建关联队列
void RMQueue(dispatch_queue_t q);

//创建一个自定义队列
dispatch_queue_t RMCreateQueue(const char *label,
                               dispatch_queue_attr_t attr);

//判断队列是否是当前队列
BOOL RMQueueCurrentIsTaggedQueue(dispatch_queue_t q);

//获取关联队列
dispatch_queue_t RMQueueGetCurrentTagged();

//判断当前线程是否为主线程
BOOL RMQueueCurrentIsMainQueue();

//安全的同步线程 防止主线程同步造成死锁
void RMQueueSafeDispatchSync(dispatch_queue_t q, dispatch_block_t block);

//断言专用 哦呵呵^_^
#define RMAssertQueue(q)        NSAssert(RMQueueCurrentIsTaggedQueue(q), @"Must run on queue: " #q)

#define RMAssertMainQueue()     NSAssert(RMQueueCurrentIsMainQueue(), @"Must run on main queue")
