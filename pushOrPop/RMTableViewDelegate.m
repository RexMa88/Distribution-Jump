//
//  RMTableViewDelegate.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/6.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMTableViewDelegate.h"

@implementation RMTableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - setter & getter

- (void)setViewControllerClass:(Class)viewControllerClass{
    _viewControllerClass = viewControllerClass;
}

@end