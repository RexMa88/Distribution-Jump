//
//  CALayer+Utils.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/6.
//  Copyright © 2016年 RexMa. All rights reserved.
//
/**
 *  利用CAlayer的content属性加载图片是一种十分高效的方法，同一张图片只生成一块内存。不会产生重复的内存。
 *
 *
 */

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Utils)

- (CALayer *)imageWithNotNullName:(NSString *)imageName;

@end
