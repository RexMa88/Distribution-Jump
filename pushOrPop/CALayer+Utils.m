//
//  CALayer+Utils.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/6.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "CALayer+Utils.h"

@implementation CALayer (Utils)

- (CALayer *)imageWithNotNullName:(NSString *)imageName{
    CALayer *layerImage;
    if (imageName.length == 0) return nil;
    else{
        layerImage = [CALayer layer];
        UIImage *image = [UIImage imageNamed:imageName];
        layerImage.contents = (__bridge id)image.CGImage;
    }
    return layerImage;
}

@end
