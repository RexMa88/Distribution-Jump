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

/**
 *  1.默认TableViewCellIdentifier是NSStringFromClass([cell class])
 *  2.默认dataSource的dataArray的结构是二重数组，即：@[@[...], @[...], ...];
 *  3.默认所有自定义Cell继承RMBaseCell，如果初始化时，没有说明Cell的类型，则使用UITableViewCell作为重用的cell.
 *  4.数组默认使用超类(BaseViewController)中的dataArray
 */

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : BaseViewController
//TableView
@property (nonatomic, strong) UITableView * tableView;
/**
 *  The method of initialize UITableView
 */
- (UITableView *)tableViewWithUITableViewStyle:(UITableViewStyle)tableViewStyle;
//The default Cell is UITableViewCell
- (UITableView *)tableViewWithFrame:(CGRect)frame TableViewStyle:(UITableViewStyle)tableViewStyle;
//The default Cell is CustomTableViewCell
- (UITableView *)tableViewWithFrame:(CGRect)frame TableViewStyle:(UITableViewStyle)tableViewStyle cell:(id)cell;
//The default Cell is not only one
- (UITableView *)tableViewWithFrame:(CGRect)frame TableViewStyle:(UITableViewStyle)tableViewStyle cellArray:(NSArray *)cellArray;

@end

NS_ASSUME_NONNULL_END
