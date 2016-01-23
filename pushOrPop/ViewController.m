//
//  ViewController.m
//  pushOrPop
//
//  Created by RexMa on 15/11/24.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "ViewController.h"
#import "pushButton.h"

#import "RMLocationShareManager.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import "RMPOISearchRequest.h"

static NSString * const secondVCString = @"SecondViewController";//跳转的第二个界面字段

static NSString * const thirdVCString  = @"ThirdViewController";//跳转的第三个界面字段

@interface ViewController ()<AMapLocationManagerDelegate, AMapSearchDelegate>

//The customDataSource of TableView
@property (nonatomic, strong) RMTableViewDataSource * dataSource;

@property (nonatomic, strong) RMTableViewDelegate * delegate;

@property (nonatomic, weak) id associatedObject;//关联变量

@property (nonatomic, strong) AMapSearchAPI *search;//搜索API

@end

@implementation ViewController

//+ (void)load{
//    //启动定位模块
//    __block id observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification
//                                                      object:nil
//                                                       queue:nil
//                                                  usingBlock:^(NSNotification * _Nonnull note) {
//                                                      [RMLocationShareManager shareManager];
//                                                      //Don't forget removeObserver
//                                                      [[NSNotificationCenter defaultCenter] removeObserver:observer];
//                                                  }];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureLocation];
    [self runLoopCalculateData];
//    [self customUI];
}

#pragma mark - Location

- (void)configureLocation{
    //The AMapSearchAPI of Configuration
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    //定位单例
    [[RMLocationShareManager shareManager] setDelegate:self];
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
                                                                           
//                                                                           if (condition) {
//                                                                               CFRunLoopRemoveObserver(runLoop, observer, kCFRunLoopDefaultMode);
//                                                                               CFRelease(observer);
//                                                                               return ;
//                                                                           }
                                                                           
//                                                                           NSLog(@"Please calculate data...");
//                                                                           for (int i = 0; i < 100; i++) {
//                                                                               dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                                                                                   NSLog(@"The Thread is %@",[NSThread currentThread]);
//                                                                                   NSLog(@"Hi,Let's Calculate");
//                                                                               });
//                                                                           }
                                                                       });
    CFRunLoopAddObserver(runLoop, observer, runLoopMode);
}

#pragma mark - AMapLocationManagerDelegate

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location{
//    NSLog(@"The Location is %f, %f", location.coordinate.latitude, location.coordinate.longitude);
    //使用单例模式，虽然会全局占用内存，但比每次调用该代理重复创建要高效
    [[RMLocationShareManager shareManager] stopUpdatingLocation];
    [self.search AMapPOIAroundSearch:[[RMPOISearchRequest shareManager] initWithLocation:location
                                               keywords:@"咖啡"
                                                  types:@"餐饮服务"]];
}

#pragma mark - AMapSearchDelegate

- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response{
    if (response.pois.count) {
        //The configuration of RMTableViewDataSource
        self.dataSource = [[RMTableViewDataSource alloc] initWithDataArray:response.pois cell:[UITableViewCell class]];
        self.dataSource.configureCellBlock = ^(UITableViewCell *cell, AMapPOI *poi){
            cell.textLabel.text = [NSString stringWithFormat:@"%@",poi.name];
        };
        //The configuration of RMTableViewDelegate
        self.delegate = [[RMTableViewDelegate alloc] initWithDataArray:response.pois];
        __weak typeof(self)weakSelf = self;
        self.delegate.actBlock = ^(NSString *action, NSDictionary *obj){
            __strong typeof(weakSelf) strongSelf = weakSelf;
            NotificationPostNotify(action, strongSelf, obj);
        };
        
        [self customUI];
    }
}
     
#pragma mark - custom Method

- (void)customUI{
    self.tableView = [self tableViewWithFrame:CGRectMake(0, kNavigationAndStatusBarHeight, kWidth, kHeight - kNavigationAndStatusBarHeight) TableViewStyle:UITableViewStyleGrouped cellArray:@[NSClassFromString(@"UITableViewCell")]];
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
