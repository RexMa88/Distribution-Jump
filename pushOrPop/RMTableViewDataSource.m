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

#import <AMapSearchKit/AMapSearchKit.h>

@interface RMTableViewDataSource()

@property (readwrite, nonatomic, strong, nonnull) Class cell;

@end

@implementation RMTableViewDataSource

#pragma mark - The Method of initialization of dataSource

- (instancetype)init{
    self = [self initWithDataArray:@[]];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithDataArray:(NSArray *)dataArray{
    self = [self initWithDataArray:dataArray cell:[UITableViewCell class]];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithDataArray:(NSArray *)dataArray cell:(id)cell{
    self = [super init];
    if (self) {
        self.dataArray = [dataArray mutableCopy];
        self.cell = cell;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return self.dataArray.count;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellString = NSStringFromClass(self.cell);
    if ([cellString isEqualToString:@"UITableViewCell"]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }else return nil;
}

#pragma mark - custom Method

- (void)configureCell:(id)cell atIndexPath:(NSIndexPath *)indexPath{
    id model = self.dataArray[indexPath.row];
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, model);
    }
}

@end
