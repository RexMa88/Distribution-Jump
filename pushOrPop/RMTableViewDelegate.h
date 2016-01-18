//
//  RMTableViewDelegate.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/6.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef NS_DESIGNATED_INITIALIZER
#if __has_attribute(objc_designated_initializer)
#define NS_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
#else
#define NS_DESIGNATED_INITIALIZER
#endif
#endif

NS_ASSUME_NONNULL_BEGIN

typedef void(^actionBlock)(NSString *action, NSDictionary *obj);

@interface RMTableViewDelegate : NSObject<UITableViewDelegate>

@property (nonatomic, copy) actionBlock actBlock;

- (instancetype)initWithDataArray:(NSArray *)dataArray NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
