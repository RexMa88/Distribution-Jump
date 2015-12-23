//
//  RMCellHeaderView+Utils.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/24.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMCellHeaderView.h"

@interface RMCellHeaderView (Utils)

/**
 *  This is a RMCellHeaderView Category
 *
 *  @param url                       The imageView URL
 *  @param srcViewController         The srcViewController is baed on BaseViewController
 *  @param destinationViewController The DestinationViewController
 *  @param userInfo                  And what you wanna to push (please reference Define.h ^_^)
 */
- (void)configureImageURL:(NSURL *)url srcViewController:(NSString *)srcViewController destinationViewController:(NSString *)destinationViewController userInfo:(NSDictionary *)userInfo;

@end
