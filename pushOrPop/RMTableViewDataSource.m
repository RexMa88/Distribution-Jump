//
//  RMTableViewDataSource.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/5.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMTableViewDataSource.h"
#import "RMBaseCell.h"
#import <objc/runtime.h>

@interface RMTableViewDataSource()


@end

@implementation RMTableViewDataSource

#pragma mark - UITableViewDataSource

- (id)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RMBaseCell * cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark - custom Method

- (void)configureCell:(id)cell atIndexPath:(NSIndexPath *)indexPath{
    id model = self.dataArray[indexPath.section][indexPath.row];
    if (self.configureCellBlock) {
        self.configureCellBlock = (cell, model);
    }
}

@end
