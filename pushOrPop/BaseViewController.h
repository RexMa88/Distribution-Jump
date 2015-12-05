//
//  BaseViewController.h
//  pushOrPop
//
//  Created by RexMa on 15/11/26.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface BaseViewController : UIViewController

//上一级界面
@property (nonatomic, strong) Class srcControllerClass;
//Local ViewController Class String
@property (nonatomic, strong) NSString * classString;
/**
 *  notification carry the data to dataDict or dataArray
 */
@property (nonatomic, strong) NSDictionary * dataDict;

@property (nonatomic, strong) NSArray * dataArray;
//动态关联key associate_key
@property (nonatomic, copy) NSString * associateKey;
//动态关联值
@property (nonatomic, strong) id associatedObject;

//Convert NSString to char
- (void)setAssociateKey:(NSString *)associateKey;
//通过objc_setAssociatedObject动态关联
- (void)setAssociatedObject:(id)object;
//通过objc_getAssociatedObject获取关联值
- (id)associatedObject;

@end
