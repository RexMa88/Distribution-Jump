//
//  UITableView+RMIndexPathHeightCache.h
//  pushOrPop
//
//  Created by 马超 on 16/2/12.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMIndexPathHeightCache : NSObject

@property (nonatomic, assign) BOOL automaticallyInvalidateEnabled;

// Height cache
- (BOOL)existsHeightAtIndexPath:(NSIndexPath *)indexPath;
- (void)cacheHeight:(CGFloat)height byIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath;
- (void)invalidateHeightAtIndexPath:(NSIndexPath *)indexPath;
- (void)invalidateAllHeightCache;

@end


@interface UITableView (RMIndexPathHeightCache)

@property (nonatomic, strong, readonly) RMIndexPathHeightCache *fd_indexPathHeightCache;

@end

@interface UITableView (RMIndexPathHeightCacheInvalidation)

- (void)rm_reloadDataWithoutInvalidateIndexPathHeightCache;

@end