//
//  BaseViewController.h
//  pushOrPop
//
//  Created by RexMa on 15/11/26.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

//上一级界面
@property (nonatomic, strong) Class srcControllerClass;
/**
 *  notification carry the data to dataDict or dataArray
 */
@property (nonatomic, strong) NSDictionary * dataDict;

@property (nonatomic, copy) NSArray * dataArray;

//- (void)setAssociateKey:(NSString *)associateKey;
//通过objc_setAssociatedObject动态关联
- (void)setAssociatedObject:(id)object;
//通过objc_getAssociatedObject获取关联值
- (id)getAssociatedObject;

@end

NS_ASSUME_NONNULL_END
