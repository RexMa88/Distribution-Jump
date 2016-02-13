//
//  UITableView+RMIndexPathHeightCache.m
//  pushOrPop
//
//  Created by 马超 on 16/2/12.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "UITableView+RMIndexPathHeightCache.h"
#import <objc/runtime.h>

//iOS 9新特性--轻量级泛型,数组中必须是NSNumber的数组
typedef NSMutableArray<NSMutableArray<NSNumber *> *> RMIndexPathHeightsBySection;

@interface RMIndexPathHeightCache ()

//垂直高度
@property (nonatomic, strong) RMIndexPathHeightsBySection *heightsBySectionForPortrait;
//水平高度
@property (nonatomic, strong) RMIndexPathHeightsBySection *heightsBySectionForLandscape;

@end

@implementation RMIndexPathHeightCache

- (instancetype)init{
    self = [super init];
    if (self) {
        _heightsBySectionForPortrait = [NSMutableArray array];
        _heightsBySectionForLandscape = [NSMutableArray array];
    }
    
    return self;
}

- (RMIndexPathHeightsBySection *)heightsBySectionForCurrentOrientation{
    return [UIDevice currentDevice].orientation ?
    self.heightsBySectionForPortrait : self.heightsBySectionForLandscape;
}

- (void)enumerateAllOrientationsUsingBlock:(void (^)(RMIndexPathHeightsBySection *heightBySection))block{
    block(self.heightsBySectionForLandscape);
    block(self.heightsBySectionForPortrait);
}

- (BOOL)existsHeightAtIndexPath:(NSIndexPath *)indexPath{
    [self buildCachesAtIndexPathsIfNeeded:@[indexPath]];
    NSNumber *number = [self heightsBySectionForCurrentOrientation][indexPath.section][indexPath.row];
    return ![number isEqualToNumber:@-1];
}

- (void)cacheHeight:(CGFloat)height byIndexPath:(NSIndexPath *)indexPath{
    self.automaticallyInvalidateEnabled = YES;
    [self buildCachesAtIndexPathsIfNeeded:@[indexPath]];
    [self heightsBySectionForCurrentOrientation][indexPath.section][indexPath.row] = @(height);
}

- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath{
    [self buildCachesAtIndexPathsIfNeeded:@[indexPath]];
    NSNumber *number = [self heightsBySectionForCurrentOrientation][indexPath.section][indexPath.row];
#if CGFLOAT_IS_DOUBLE
    return number.doubleValue;
#else
    return number.floatValue;
#endif
}

- (void)invalidateHeightAtIndexPath:(NSIndexPath *)indexPath{
    [self buildCachesAtIndexPathsIfNeeded:@[indexPath]];
    [self enumerateAllOrientationsUsingBlock:^(RMIndexPathHeightsBySection *heightBySection) {
        heightBySection[indexPath.section][indexPath.row] = @-1;
    }];
}

- (void)invalidateAllHeightCache {
    [self enumerateAllOrientationsUsingBlock:^(RMIndexPathHeightsBySection *heightsBySection) {
        [heightsBySection removeAllObjects];
    }];
}

- (void)buildCachesAtIndexPathsIfNeeded:(NSArray *)indexPaths{
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *indexPath, NSUInteger idx, BOOL * _Nonnull stop) {
        [self buildSectionsIfNeeded:indexPath.section];
        [self buildRowsIfNeeded:indexPath.row inExistSection:indexPath.section];
    }];
}

- (void)buildSectionsIfNeeded:(NSInteger)targetSection{
    [self enumerateAllOrientationsUsingBlock:^(RMIndexPathHeightsBySection *heightBySection) {
        for(NSInteger section = 0; section <= targetSection; ++section){
            if (section >= heightBySection.count) {
                heightBySection[section] = [NSMutableArray array];
            }
        }
    }];
}

- (void)buildRowsIfNeeded:(NSInteger)targetRow inExistSection:(NSInteger)section{
    [self enumerateAllOrientationsUsingBlock:^(RMIndexPathHeightsBySection *heightBySection) {
        NSMutableArray<NSNumber *> *heightsByRow = heightBySection[section];
        for (NSInteger row = 0; row <= targetRow; ++row) {
            if (row >= heightsByRow.count) {
                heightsByRow[row] = @-1;
            }
        }
    }];
}

@end

@implementation UITableView (RMIndexPathHeightCache)

- (RMIndexPathHeightCache *)rm_indexPathHeightCache{
    RMIndexPathHeightCache *cache = objc_getAssociatedObject(self, _cmd);
    if (!cache) {
        [self methodSignatureForSelector:nil];
        cache = [RMIndexPathHeightCache new];
        objc_setAssociatedObject(self, _cmd, cache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return cache;
}

@end

static void __RM_TEMPLATE_LAYOUT_CELL_PRIMARY_CALL_IF_CRASH_NOT_OUR_BUG__(void(^callout)(void)) {
    callout();
}
#define RMPrimaryCall(...) do {__RM_TEMPLATE_LAYOUT_CELL_PRIMARY_CALL_IF_CRASH_NOT_OUR_BUG__(^{__VA_ARGS__});} while(0)

@implementation UITableView (RMIndexPathHeightCacheInvalidation)

- (void)rm_reloadDataWithoutInvalidateIndexPathHeightCache{
    RMPrimaryCall([self rm_reloadData];);
}

//Method Swizzling
+ (void)load{
    SEL selectors[] = {
    @selector(reloadData),
    @selector(insertSections:withRowAnimation:),
    @selector(deleteSections:withRowAnimation:),
    @selector(reloadSections:withRowAnimation:),
    @selector(moveSection:toSection:),
    @selector(insertRowsAtIndexPaths:withRowAnimation:),
    @selector(deleteRowsAtIndexPaths:withRowAnimation:),
    @selector(reloadRowsAtIndexPaths:withRowAnimation:),
    @selector(moveRowAtIndexPath:toIndexPath:)
    };
    
    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originSelector = selectors[index];
        SEL swizzleSelector = NSSelectorFromString([@"rm_" stringByAppendingString:NSStringFromSelector(originSelector)]);
        Method originMethod = class_getInstanceMethod(self, originSelector);
        Method swizzleMethod = class_getInstanceMethod(self, swizzleSelector);
        method_exchangeImplementations(originMethod, swizzleMethod);
    }
}

- (void)rm_reloadData{
    if (self.rm_indexPathHeightCache.automaticallyInvalidateEnabled) {
        [self.rm_indexPathHeightCache enumerateAllOrientationsUsingBlock:^(RMIndexPathHeightsBySection *heightBySection) {
            [heightBySection removeAllObjects];
        }];
    }
    RMPrimaryCall([self rm_reloadData];);
}



@end
