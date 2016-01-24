//
//  RMPOITableViewCell.m
//  pushOrPop
//
//  Created by Rex Ma on 16/1/23.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMPOITableViewCell.h"
#import <AMapSearchKit/AMapSearchKit.h>

NSString *const RMPOITableViewCellIdentifier = @"RMPOITableViewCell";

@implementation RMPOITableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setter

- (void)setPoi:(AMapPOI *)poi{
    _poi = poi;
    
    _addressLabel.text = poi.address;
    _nameLabel.text = poi.name;
    _telLbael.text = poi.tel;
}

@end
