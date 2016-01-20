//
//  UIImageView+Utils.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/20.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "UIImageView+Utils.h"

@implementation UIImageView (Utils)

- (void)sizeToFitWidth:(NSUInteger)width{
    NSUInteger screenWidth = MIN(width, self.image.size.width);
    NSUInteger screenHeight = self.image.size.height;
    self.size = CGSizeMake(screenWidth, screenHeight);
}

- (void)sizeToFitHeight:(NSUInteger)height{
    NSUInteger screenWidth = self.image.size.width;
    NSUInteger screenHeight = MIN(height, self.image.size.height);
    self.size = CGSizeMake(screenWidth, screenHeight);
}

@end
