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
#import "RMTableViewDelegate.h"

@interface BaseTableViewController ()

@property (nonatomic, strong) RMTableViewDataSource * dataSource;//UITableViewDataSource

@property (nonatomic, strong) RMTableViewDelegate * delegate;

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
    [self setTableViewDelegate];
    //Actually，The dataSource should be definition
}

- (void)setTableViewDelegate{
    self.delegate = [[RMTableViewDelegate alloc] init];
    self.delegate.dataArray = self.dataArray;
}

- (void)setTableviewDataSource{
    self.dataSource = [[RMTableViewDataSource alloc] init];
    //The setting of dataSource
    self.dataSource.dataArray        = self.dataArray;
    self.dataSource.reuseIdentifier  = [self.dataDict objectForKey:kTableViewReuseIdentifier];
    self.dataSource.configureCellBlock = ^(RMBaseCell *cell, id item){
        cell.textLabel.text = item;
    };
    self.tableView.dataSource   = self.dataSource;
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
