//
//  BaseViewController.h
//  pushOrPop
//
//  Created by Rex Ma on 15/11/26.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface BaseViewController : UIViewController

//上级界面类
@property (nonatomic, strong) Class srcControllerClass;

//动态关联值
@property (nonatomic, strong) id associatedObject;
//通过objc_setAssociatedObject动态关联
- (void)setAssociatedObject:(id)object;
//通过objc_getAssociatedObject获取关联值
- (id)associatedObject;

@end
