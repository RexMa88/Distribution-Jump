//
//  RMAsyncQueue.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/29.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

void RMQueue(dispatch_queue_t q);

//create a custom queue
dispatch_queue_t RMCreateQueue(const char *label,
                               dispatch_queue_attr_t attr);