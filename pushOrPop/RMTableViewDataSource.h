//
//  RMTableViewDataSource.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

/**
 *  The custom united tableViewDataSource,for reducing coupling,and I will create a custom united.TableViewDelegate.I hope someone look the demo,and help me complete it.
 *
 *
 */

#import <Foundation/Foundation.h>

typedef void (^configureBlock)(id cell, id item);

@interface RMTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, copy) configureBlock configureCellBlock;
//dataSource
@property (nonatomic, strong) NSArray *dataArray;
//TableView reuseIndentifier
@property (nonatomic, strong) NSString *reuseIdentifier;
//The Class of UITableViewCell
@property (nonatomic, strong) id cellClass;

@end
