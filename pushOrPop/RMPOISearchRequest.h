//
//  RMPOISearchRequest.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/23.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <AMapSearchKit/AMapSearchKit.h>

#ifndef NS_DESIGNATED_INITIALIZER
#if __has_attribute(objc_designated_initializer)
#define NS_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
#else
#define NS_DESIGNATED_INITIALIZER
#endif
#endif

NS_ASSUME_NONNULL_BEGIN

@interface RMPOISearchRequest : AMapPOIAroundSearchRequest

+ (instancetype)shareManager;

- (instancetype)initWithLocation:(nullable CLLocation *)location
                        keywords:(nullable NSString *)keywords
                           types:(nullable NSString *)types NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END