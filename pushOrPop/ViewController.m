//
//  ViewController.m
//  pushOrPop
//
//  Created by RexMa on 15/11/24.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "ViewController.h"
#import "pushButton.h"

static NSString * const secondVCString = @"SecondViewController";//跳转的第二个界面字段

static NSString * const thirdVCString  = @"ThirdViewController";//跳转的第三个界面字段

@interface ViewController ()

//The customDataSource of TableView
@property (nonatomic, strong) RMTableViewDataSource * dataSource;

@property (nonatomic, strong) RMTableViewDelegate * delegate;

//@property (nonatomic, strong) pushButton * pushSecondBtn;//push seconde按钮
//@property (nonatomic, strong) pushButton * pushthirdBtn;

@property (nonatomic, weak) id associatedObject;//关联变量

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self runLoopCalculateData];
    [self customDataSourceAndDelegate];
    [self customUI];
}

#pragma mark - Calculate Data by using RunLoop(Height,Data,Date....)
/**
 *  利用RunLoop的CFRunLoopActivity在RunLoop即将休眠的时候进行数据处理，现在只是进行了一个简单的处理添加，还未进行深度封装.
 *  在RunLoop的DefaultMode下进行异步并发处理，如果加上分发源进行处理，处理速度将十分可观。
 */
- (void)runLoopCalculateData{
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    CFStringRef runLoopMode = kCFRunLoopDefaultMode;
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault,
                                                                       kCFRunLoopBeforeWaiting,
                                                                       true,
                                                                       0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
                                                                           NSLog(@"Please calculate data...");
//                                                                           for (int i = 0; i < 100; i++) {
//                                                                               dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                                                                                   NSLog(@"The Thread is %@",[NSThread currentThread]);
//                                                                                   NSLog(@"Hi,Let's Calculate");
//                                                                               });
//                                                                           }
                                                                       });
    CFRunLoopAddObserver(runLoop, observer, runLoopMode);
}

#pragma mark - DataSource && Delegate

- (void)customDataSourceAndDelegate{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [array addObject:[NSNumber numberWithInt:i]];
    }
//    self.dataArray = [array mutableCopy];
    self.dataSource = [[RMTableViewDataSource alloc] initWithDataArray:array cell:[UITableViewCell class]];
    self.dataSource.configureCellBlock = ^(UITableViewCell *cell, NSNumber *num){
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)[num integerValue]];
    };
    self.delegate = [[RMTableViewDelegate alloc] initWithDataArray:array];
    __weak typeof(self)weakSelf = self;
    self.delegate.actBlock = ^(NSString *action, NSDictionary *obj){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NotificationPostNotify(action, strongSelf, obj);
    };
}
     
#pragma mark - custom Method

- (void)customUI{
    //second push button
//    self.pushSecondBtn = [[pushButton alloc] initWithFrame:CGRectMake(0, 100, kWidth, 30)];
//    [self.pushSecondBtn setTitle:@"pushSecond" forState:UIControlStateNormal];
//    [self.pushSecondBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    self.pushSecondBtn.backgroundColor = [UIColor blueColor];
//    self.pushSecondBtn.pushVCStr = secondVCString;
//    [self.pushSecondBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.pushSecondBtn];
//    //third push button
//    self.pushthirdBtn = [pushButton buttonWithType:UIButtonTypeCustom];
//    self.pushthirdBtn.frame = CGRectMake(0, 150, kWidth, 30);
//    [self.pushthirdBtn setTitle:@"pushThird" forState:UIControlStateNormal];
//    [self.pushthirdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    self.pushthirdBtn.backgroundColor = [UIColor yellowColor];
//    self.pushthirdBtn.pushVCStr = thirdVCString;
//    [self.pushthirdBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.pushthirdBtn];
    self.tableView = [self tableViewWithFrame:kScreenBounds TableViewStyle:UITableViewStyleGrouped cellArray:@[NSClassFromString(@"UITableViewCell")]];
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
}


- (void)pushAction:(pushButton *)button{
    //跳转传输的数据
    NSString * pushVCStr = button.pushVCStr;
    NSDictionary * dict = @{kDictionaryKeyClass: pushVCStr};
    NotificationPostNotify(KNotificationPushAction, self, dict);
}

#pragma mark - runtime objc_getAssociatedObject && objc_setAssociatedObject

- (void)setAssociatedObject:(id)object{
    [super setAssociatedObject:object];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
