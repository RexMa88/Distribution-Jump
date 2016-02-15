//
//  RMWeatherViewController.m
//  pushOrPop
//
//  Created by 马超 on 16/2/13.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMWeatherViewController.h"
#import "RMWeatherRequest.h"
#import <ReactiveCocoa.h>
#import "RMWeatherModel.h"

@interface RMWeatherViewController ()

@end

@implementation RMWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //RACObserver
    [[RACObserve([RMWeatherRequest shareManager], weatherModel) deliverOn:RACScheduler.mainThreadScheduler]
     subscribeNext:^(RMWeatherModel *weatherModel) {
         NSLog(@"The model is %@",weatherModel);
     }];
    
    [[RMWeatherRequest shareManager] findCurrentLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
