//
//  RMTextAttribute.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/21.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMTextAttribute : NSObject

@end

@interface RMTextShadow : NSObject<NSCoding, NSCopying>

+ (instancetype)shadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGSize offset;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGBlendMode blendMode;
@property (nonatomic, strong) RMTextShadow *subShadow;//subShadow

+ (instancetype)shadowWithNSShadow:(NSShadow *)nsShadow;//将NSShadow转换成RMTextShadow
- (NSShadow *)nsShadow;
@end
