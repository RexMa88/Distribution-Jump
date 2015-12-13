//
//  RMTableViewDelegate.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/6.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMTableViewDelegate : NSObject<UITableViewDelegate>

@property (nonatomic, strong) NSArray * dataArray;//dataArray

@property (nonatomic, assign) BOOL isPush;

@property (nonatomic, strong) Class viewControllerClass;

@end
