//
//  RMPOITableViewCell.h
//  pushOrPop
//
//  Created by Rex Ma on 16/1/23.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AMapPOI;
#define RMPOITableViewCellHeight 98.0f
extern NSString *const RMPOITableViewCellIdentifier;

@interface RMPOITableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *telLbael;

@property (nonatomic, strong) AMapPOI *poi;

- (void)setPoi:(AMapPOI * _Nonnull)poi;

@end

NS_ASSUME_NONNULL_END
