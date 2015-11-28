//
//  ViewController.m
//  pushOrPop
//
//  Created by RexMa on 15/11/24.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton * pushBtn;//push Button

@property (nonatomic, weak) id associatedObject;//关联变量

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self customUI];
}

#pragma mark - custom Method

- (void)customUI{
    self.pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, kWidth, 30)];
    [self.pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [self.pushBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.pushBtn.backgroundColor = [UIColor blueColor];
    [self.pushBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pushBtn];
}

- (void)pushAction:(id)sender{
    //跳转传输的数据
    NSDictionary * dict = @{kDictionaryKeyClass: @"SecondViewController"};
    NotificationPostNotify(KNotificationPushAction, self, dict);
}

#pragma mark - runtime objc_getAssociatedObject && objc_setAssociatedObject

- (void)setAssociatedObject:(id)object{
    [super setAssociatedObject:object];
}

- (id)associatedObject{
    self.associatedObject = [super associatedObject];
    if (self.associatedObject) {
        
    }
    return self.associatedObject;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
