//
//  BaseTableViewController.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController
//TableView
@property (nonatomic, strong) UITableView * tableView;
//TableViewType
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

@end
