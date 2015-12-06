//
//  RMTableViewDataSource.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMTableViewDataSource : NSObject<UITableViewDataSource>

//dataSource
@property (nonatomic, strong) NSArray * dataArray;
//TableView reuseIndentifier
@property (nonatomic, strong) NSString * reuseIdentifier;
//The Class of UITableViewCell
@property (nonatomic, strong) NSString * cellClassStr;
//cellClass setter
- (void)setCellClassStr:(NSString *)cellClassStr;
@end
