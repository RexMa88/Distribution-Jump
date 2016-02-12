//
//  UITableView+RMTempLayout.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/10.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexPathHeightCache : NSObject

- (BOOL)existIndexPathHeightCache:(NSIndexPath *)indexPath;
- (void)cacheHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath;

@end

@interface UITableView (RMTempLayout)

- (CGFloat)cellHeightWithIdentifier:(NSString *)identifier
                   cacheByIndexPath:(NSIndexPath *)indexPath
                      configuration:(void (^)(id cell))configuration;


@end
