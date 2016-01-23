//
//  RMLocationShareManager.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/23.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <AMapLocationKit/AMapLocationKit.h>

@interface RMLocationShareManager : AMapLocationManager

+ (instancetype)shareManager;

@end
