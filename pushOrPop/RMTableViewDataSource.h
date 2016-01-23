//
//  RMTableViewDataSource.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

/**
 *  The custom united tableViewDataSource,for reducing coupling,and I will create a custom united.TableViewDelegate.I hope someone look the demo,and help me complete it.
 *
 *
 */

#import <Foundation/Foundation.h>

#ifndef NS_DESIGNATED_INITIALIZER
#if __has_attribute(objc_designated_initializer)
#define NS_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
#else
#define NS_DESIGNATED_INITIALIZER
#endif
#endif

NS_ASSUME_NONNULL_BEGIN

@class AMapPOI;

typedef void (^configureBlock)(id cell, id item);

@interface RMTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, copy) configureBlock configureCellBlock;

@property (nonatomic, copy, nullable) NSArray<AMapPOI *> *dataArray;

- (instancetype)initWithDataArray:(NSArray *)dataArray;

- (instancetype)initWithDataArray:(NSArray *)dataArray cell:(id)cell NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
