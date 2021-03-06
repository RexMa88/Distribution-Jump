//
//  RMBaseCell.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const cellIdentifier;
@interface RMBaseCell : UITableViewCell

//动态加载的Key
@property (nonatomic, copy) NSString * associateKey;
//动态加载的associateObject
@property (nonatomic, strong) id associateObject;
//配置Cell方法
- (void)buildCell;
//动态加载
- (void)setAssociateObject:(id)object withAssociateKey:(NSString *)associateKey;
//获取动态加载
- (id)getAssociateObjectWithAssociateKey:(NSString *)associateKey;

@end
