//
//  RMTableViewDelegate.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/6.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMTableViewDelegate.h"
#import "SecondViewController.h"

@implementation RMTableViewDelegate

- (instancetype)initWithDataArray:(NSArray *)dataArray{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.actBlock) {
        NSDictionary *obj = @{kDictionaryKeyClass: [SecondViewController class]};
        self.actBlock(KNotificationPushAction, obj);
    }
}

#pragma mark - setter & getter

- (void)setViewControllerClass:(Class)viewControllerClass{
    _viewControllerClass = viewControllerClass;
}

@end
