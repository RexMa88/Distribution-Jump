//
//  SecondViewController.m
//  pushOrPop
//
//  Created by RexMa on 15/11/26.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "SecondViewController.h"
#import "RMBaseCell.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)initializeTableView{
    [super initializeTableView];
}

- (void)setDataSource:(RMTableViewDataSource *)dataSource{
    self.dataSource = [[RMTableViewDataSource alloc] init];
    self.dataSource.dataArray = self.dataArray;
    self.dataSource.reuseIdentifier = @"cellIdentifier";
    self.dataSource.configureCellBlock = ^(RMBaseCell *cell, id item){
        
    };
    self.tableView.dataSource = self.dataSource;
}

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
