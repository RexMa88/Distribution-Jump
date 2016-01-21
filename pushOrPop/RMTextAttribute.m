//
//  RMTextAttribute.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/21.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMTextAttribute.h"

@implementation RMTextAttribute

@end

@implementation RMTextShadow

+ (instancetype)shadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius{
    RMTextShadow *one = [self new];
    one.color = color;
    one.offset = offset;
    one.radius = radius;
    return one;
}

+ (instancetype)shadowWithNSShadow:(NSShadow *)nsShadow{
    if (!nsShadow) return nil;
    
    RMTextShadow *shadow = [self new];
    shadow.offset = nsShadow.shadowOffset;
    shadow.radius = nsShadow.shadowBlurRadius;
    id color = nsShadow.shadowColor;
    if (color) {
        if (CGColorGetTypeID() == CFGetTypeID((__bridge CFTypeRef)(color))) {
            color = [UIColor colorWithCGColor:(__bridge CGColorRef)(color)];
        }
        if ([color isKindOfClass:[UIColor class]]) {
            shadow.color = color;
        }
    }
    
    return shadow;
}

- (NSShadow *)nsShadow{
    NSShadow *shadow = [NSShadow new];
    shadow.shadowOffset = self.offset;
    shadow.shadowBlurRadius = self.radius;
    shadow.shadowColor = self.color;
    return shadow;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.color forKey:@"color"];
    [aCoder encodeObject:@(self.radius) forKey:@"radius"];
    [aCoder encodeObject:[NSValue valueWithCGSize:self.offset] forKey:@"offset"];
    [aCoder encodeObject:self.subShadow forKey:@"subShadow"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    self.color = [aDecoder decodeObjectForKey:@"color"];
    self.radius = ((NSNumber *)[aDecoder decodeObjectForKey:@"radius"]).floatValue;
    self.offset = ((NSValue *)[aDecoder decodeObjectForKey:@"offset"]).CGSizeValue;
    _subShadow = [aDecoder decodeObjectForKey:@"subShadow"];
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    typeof(self) one = [self.class new];
    one.color = self.color;
    one.offset = self.offset;
    one.radius = self.radius;
    one.subShadow = self.nsShadow.copy;
    return one;
}

@end
