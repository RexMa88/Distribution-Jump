//
//  RMCellHeaderView+Utils.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/24.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMCellHeaderView+Utils.h"

@implementation RMCellHeaderView (Utils)

- (void)configureImageURL:(NSURL *)url srcViewController:(NSString *)srcViewController destinationViewController:(NSString *)destinationViewController userInfo:(NSDictionary *)userInfo{
    [self configureImageURL:url tapped:^{
        //同步处理...后面可以使用SDWebImage解决.
        [self.headerImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:url]]];
        NotificationPostNotify(KNotificationPushAction, [srcViewController class], userInfo);
    }];
}

@end
