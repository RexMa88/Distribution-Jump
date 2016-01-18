//
//  RMTableViewDelegate.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/6.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^actionBlock)(NSString *action, NSDictionary *obj);

@interface RMTableViewDelegate : NSObject<UITableViewDelegate>

@property (nonatomic, copy) actionBlock actBlock;

@property (nonatomic, assign) BOOL isPush;

@property (nonatomic, strong) Class viewControllerClass;

- (instancetype)initWithDataArray:(NSArray *)dataArray NS_DESIGNATED_INITIALIZER;

@end
