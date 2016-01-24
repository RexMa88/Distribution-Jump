//
//  BaseTableViewController.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "BaseTableViewController.h"

#import "RMBaseCell.h"
#import "RMPOITableViewCell.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self customUI];
}

#pragma mark - The Initialization Method of TableView

- (UITableView *)tableViewWithUITableViewStyle:(UITableViewStyle)tableViewStyle{
    self.tableView = [self tableViewWithFrame:kScreenBounds TableViewStyle:tableViewStyle];
    return self.tableView;
}

- (UITableView *)tableViewWithFrame:(CGRect)frame
                     TableViewStyle:(UITableViewStyle)tableViewStyle{
    self.tableView = [self tableViewWithFrame:frame TableViewStyle:tableViewStyle cell:[UITableViewCell class]];
    return self.tableView;
}

- (UITableView *)tableViewWithFrame:(CGRect)frame
                     TableViewStyle:(UITableViewStyle)tableViewStyle
                               cell:(id)cell{
    NSArray *cellArray = @[[cell class]];
    self.tableView = [self tableViewWithFrame:frame TableViewStyle:tableViewStyle cellArray:cellArray];
    return self.tableView;
}

- (UITableView *)tableViewWithFrame:(CGRect)frame
                     TableViewStyle:(UITableViewStyle)tableViewStyle
                          cellArray:(NSArray *)cellArray{
    //如果是一种cell
    self.tableView = [[UITableView alloc] initWithFrame:frame style:tableViewStyle];
    if (cellArray.count == 1) {
        NSString *cellStr = cellArray.firstObject;
        //默认使用nib
        [self.tableView registerNib:[UINib nibWithNibName:cellStr bundle:nil] forCellReuseIdentifier:cellStr];
    }else{
        [cellArray enumerateObjectsUsingBlock:^(NSString   * _Nonnull cellStr, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.tableView registerNib:[UINib nibWithNibName:cellStr bundle:nil] forCellReuseIdentifier:cellStr];
        }];
    }
    return self.tableView;
}


//- (void)setDelegate:(RMTableViewDelegate *)delegate{
////    self.delegate = [[RMTableViewDelegate alloc] init];
////    self.delegate.dataArray = self.dataArray;
//}
//
//- (void)setDataSource:(RMTableViewDataSource *)dataSource{
////    self.dataSource = [[RMTableViewDataSource alloc] init];
//    //The setting of dataSource
////    self.dataSource.dataArray        = self.dataArray;
////    self.dataSource.reuseIdentifier  = [self.dataDict objectForKey:kTableViewReuseIdentifier];
////    self.dataSource.configureCellBlock = ^(RMBaseCell *cell, id item){
////        cell.textLabel.text = item;
////    };
////    self.tableView.dataSource   = self.dataSource;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
