//
//  SecondViewController.m
//  pushOrPop
//
//  Created by RexMa on 15/11/26.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "SecondViewController.h"
#import "RMBaseCell.h"

@interface SecondViewController ()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self customUI];
}

#pragma mark - custom UI

- (void)customUI{
    self.nameLabel = [UILabel new];
    self.nameLabel.frame = CGRectMake(0, 80, 100, 20);
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.text = _name;
    
    [self.view addSubview:self.nameLabel];
}

#pragma mark - setter

- (void)setName:(NSString *)name{
    _name = [name copy];
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
