//
//  BaseTableViewController.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "BaseTableViewController.h"
#import "RMBaseCell.h"
#import "RMTableViewDataSource.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customUI];
    
}

- (void)customUI{
    self.tableView = [[UITableView alloc] initWithFrame:kScreenBounds style:self.tableViewStyle];
    [self setTableviewDataSource];
    self.tableView.delegate = self;
    //Actually，The dataSource should be definition
}

- (void)setTableviewDataSource{
    RMTableViewDataSource * dataSource = [[RMTableViewDataSource alloc] init];
    //The setting of dataSource
    dataSource.dataArray        = self.dataArray;
    dataSource.reuseIdentifier  = [self.dataDict objectForKey:kTableViewReuseIdentifier];
    dataSource.cellClassStr     = NSStringFromClass([self.dataDict objectForKey:kTableViewCellStr]);
    self.tableView.dataSource   = dataSource;
}

- (void)setTableViewDelegate{
    
}

- (void)registerTableViewClassCell{
    
}

#pragma mark - getter && setter


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
