//
//  BaseTableViewController.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "BaseViewController.h"
#import "RMTableViewDataSource.h"
#import "RMTableViewDelegate.h"

@interface BaseTableViewController : BaseViewController
//TableView
@property (nonatomic, strong) UITableView * tableView;
//TableViewType
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
//The number of section,and if the object of dataArray is array,it will return the count of the dataArray

@property (nonatomic, strong) RMTableViewDataSource * dataSource;//UITableViewDataSource

@property (nonatomic, strong) RMTableViewDelegate * delegate;
/**
 *  The method of custom DataSource && Delegate
 *
 *  @param dataSource custom TableView dataSource
 *  @param delegate   custom TableView delegate
 */
- (void)setDataSource:(RMTableViewDataSource *)dataSource;
- (void)setDelegate:(RMTableViewDelegate *)delegate;
/**
 *  The method of initialize UITableView
 */
- (void)initializeTableView;

@end
