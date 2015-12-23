//
//  RMCellHeaderView.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/24.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMCellHeaderView.h"

@implementation RMCellHeaderView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.headerImageView = [[UIImageView alloc] initWithFrame:frame];
    }
    return self;
}

- (void)configureImageURL:(NSURL *)url tapped:(void (^)(void))block{
    
}

@end
