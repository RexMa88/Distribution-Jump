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

@property (nonatomic, weak) id cellClass;

@end

@implementation RMTableViewDataSource

#pragma mark - UITableViewDataSource

- (id)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}

@end
