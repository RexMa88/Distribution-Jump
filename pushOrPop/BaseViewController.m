//
//  BaseViewController.m
//  pushOrPop
//
//  Created by RexMa on 15/11/26.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "BaseViewController.h"

static const char associatedkey;

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - runtime objc_setAssociatedObject && objc_getAssociatedObject

- (void)setAssociatedObject:(id)object{
    objc_setAssociatedObject(self, &associatedkey, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject{
    return objc_getAssociatedObject(self, &associatedkey);
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
