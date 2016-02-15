//
//  RMWeatherModel.h
//  pushOrPop
//
//  Created by 马超 on 16/2/14.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMBaseModel.h"

@interface RMCoordinateModel : RMBaseModel

@property (nonatomic, assign) NSInteger lon;
@property (nonatomic, assign) NSInteger lat;

@end

@interface RMWindStatusModel : RMBaseModel

@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger deg;

@end

@interface RMWeatherStatusModel : RMBaseModel

@property (nonatomic, assign) NSInteger temp;
@property (nonatomic, assign) NSInteger pressure;
@property (nonatomic, assign) NSInteger humidity;
@property (nonatomic, assign) NSInteger temp_max;
@property (nonatomic, assign) NSInteger temp_min;

@end

@interface RMWeatherModel : RMBaseModel

@property (nonatomic, strong) RMCoordinateModel     *coord;
@property (nonatomic, strong) RMWindStatusModel     *wind;
@property (nonatomic, strong) RMWeatherModel        *main;

@end
