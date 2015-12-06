//
//  RMBaseCell.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMBaseCell.h"
#import <objc/runtime.h>

@implementation RMBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        //setting your TableViewCell
    }
    return self;
}

#pragma mark - associateObject

- (void)setAssociateObject:(id)object withAssociateKey:(NSString *)associateKey{
    const char * associatedKey = [associateKey UTF8String];
    objc_setAssociatedObject(self, associatedKey, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)getAssociateObjectWithAssociateKey:(NSString *)associateKey{
    const char * associatedKey = [associateKey UTF8String];
    return objc_getClass(associatedKey);
}

@end
