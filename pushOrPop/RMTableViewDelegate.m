//
//  RMTableViewDelegate.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/6.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMTableViewDelegate.h"
#import "SecondViewController.h"

@implementation RMTableViewDelegate{
    NSArray *dataArr;
}

- (instancetype)init{
    self = [self initWithDataArray:nil];
    
    if (self) {
        
    }
    
    return self;
}

- (instancetype)initWithDataArray:(NSArray *)dataArray{
    self = [super init];
    if (self) {
        dataArr = dataArray != 0 ? dataArray : nil;
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.actBlock) {
        /**
         *  配置传递数据
         */
        NSDictionary *obj = @{kDictionaryKeyClass: [SecondViewController class],
                              kDictionaryKeySelector: [NSValue valueWithPointer:@selector(setName:)],
                              kDictionaryKeyObject: [NSString stringWithFormat:@"%ld",(long)[dataArr[indexPath.row] integerValue]],
                              kDictionaryKeyAnimated: [NSNumber numberWithBool:YES]};
        self.actBlock(KNotificationPushAction, obj);
    }
}

#pragma mark - setter & getter

- (void)setViewControllerClass:(Class)viewControllerClass{
    _viewControllerClass = viewControllerClass;
}

@end
