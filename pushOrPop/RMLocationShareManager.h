//
//  RMLocationShareManager.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/23.
//  Copyright © 2016年 RexMa. All rights reserved.
//

/**
 *  继承AMapLocationManager进行单例封装
 */

#import <AMapLocationKit/AMapLocationKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RMLocationShareManager : AMapLocationManager

+ (instancetype)shareManager;

@end

NS_ASSUME_NONNULL_END