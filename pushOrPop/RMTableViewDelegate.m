//
//  RMTableViewDelegate.m
//  pushOrPop
//
//  Created by Rex Ma on 15/12/6.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "RMTableViewDelegate.h"
#import "SecondViewController.h"
#import <AMapSearchKit/AMapSearchKit.h>

@implementation RMTableViewDelegate

- (instancetype)init{
    self = [self initWithDataArray:@[]];
    
    if (self) {
        
    }
    
    return self;
}

- (instancetype)initWithDataArray:(NSArray *)dataArray{
    self = [super init];
    if (self) {
        self.dataArray = dataArray != 0 ? dataArray : @[];
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.actBlock) {
        /**
         *  配置传递数据
         */
        AMapPOI *poi = self.dataArray[indexPath.row];
        NSDictionary *obj = @{kDictionaryKeyClass: [SecondViewController class],
                              kDictionaryKeySelector: [NSValue valueWithPointer:@selector(setName:)],
                              kDictionaryKeyObject: poi.name,
                              kDictionaryKeyAnimated: [NSNumber numberWithBool:YES]};
        self.actBlock(KNotificationPushAction, obj);
    }
}

@end
