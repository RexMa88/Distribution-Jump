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
#import "RMPOITableViewCell.h"
#import "FMDB.h"
//
#import "RMCoffeeListDataBase.h"

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
    [self customUI];
    [self configureLocation];
    [self runLoopCalculateData];
    //对FMDB的再封装
    RMCoffeeListDataBase *dataBase = [[RMCoffeeListDataBase alloc] initWithPath:[self dataBasePath:@"coffee.sqlite"]];
    BOOL isSuccess = [dataBase executeOperation:@"select"
                                         name:@"coffee"
                                         data:@{@"name":@""}];
//    NSLog(@"Success is %@",isSuccess);
}

#pragma mark - Location

- (void)configureLocation{
    //The AMapSearchAPI of Configuration
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    //定位单例
    [[RMLocationShareManager shareManager] setDelegate:self];
}

#pragma mark - life Cycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.view addSubview:self.tableView];
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
    FMDatabase *database = [FMDatabase databaseWithPath:[self dataBasePath:@"coffee.sqlite"]];
    if (![database open]) return;
    if (response.pois.count) {
        //The configuration of RMTableViewDataSource
        //The Configuration of database
        //create table
        NSString *createTableSql = @"CREATE TABLE IF NOT EXISTS CoffeeList (uid integer primary key, name text NOT NULL, address text, tel text)";
        BOOL result = [database executeUpdate:createTableSql];
        if (result) {
            NSLog(@"创建成功");
            FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[self dataBasePath:@"coffee.sqlite"]];
            
            [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
                [response.pois enumerateObjectsUsingBlock:^(AMapPOI   * _Nonnull poi, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSString *insertSql = @"INSERT INTO CoffeeList (name, address, tel) VALUES (?, ?, ?)";
                    BOOL insertResult = [db executeUpdate:insertSql,poi.name, poi.address, poi.tel];
                    if (!insertResult) {
                        NSLog(@"插入错误");
                        *rollback = YES;
                        return ;
                    }
                }];
            }];
        }
        self.dataSource = [[RMTableViewDataSource alloc] initWithDataArray:response.pois cell:[RMPOITableViewCell class]];
        self.dataSource.configureCellBlock = ^(RMPOITableViewCell *cell, AMapPOI *poi){
            cell.poi = poi;
        };
        //The configuration of RMTableViewDelegate
        self.delegate = [[RMTableViewDelegate alloc] initWithDataArray:response.pois];
        __weak typeof(self)weakSelf = self;
        self.delegate.actBlock = ^(NSString *action, NSDictionary *obj){
            __strong typeof(weakSelf) strongSelf = weakSelf;
            NotificationPostNotify(action, strongSelf, obj);
        };
    }
    //关闭数据库
    [database close];

    [self configureDelegateAndDataSource];
}

- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error{
    FMDatabase *database = [FMDatabase databaseWithPath:[self dataBasePath:@"coffee.sqlite"]];
    if (![database open]) return;
    //无网络状态时，取缓存
    NSMutableArray *poiArray = [NSMutableArray array];
    NSString *selectSql = @"SELECT * FROM CoffeeList";
    FMResultSet *result = [database executeQuery:selectSql];
    NSLog(@"The result is %@",result);
    while ([result next]) {
        //取名称
        NSString *name = [result stringForColumn:@"name"];
        //取地址
        NSString *addr = [result stringForColumn:@"address"];
        //取联系方式
        NSString *tel = [result stringForColumn:@"tel"];
        //AMapPOI
        AMapPOI *poi = [[AMapPOI alloc] init];
        poi.name = [name copy];
        poi.address = [addr copy];
        poi.tel = [tel copy];
        //放入数组
        [poiArray addObject:poi];
    }
    
    self.dataSource = [[RMTableViewDataSource alloc] initWithDataArray:poiArray cell:[RMPOITableViewCell class]];
    self.dataSource.configureCellBlock = ^(RMPOITableViewCell *cell, AMapPOI *poi){
        cell.poi = poi;
    };
    //The configuration of RMTableViewDelegate
    self.delegate = [[RMTableViewDelegate alloc] initWithDataArray:poiArray];
    __weak typeof(self)weakSelf = self;
    self.delegate.actBlock = ^(NSString *action, NSDictionary *obj){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NotificationPostNotify(action, strongSelf, obj);
    };
    
    [self configureDelegateAndDataSource];
    
    [database close];
}

#pragma mark - custom Method
- (void)customUI{
    self.tableView = [self tableViewWithFrame:CGRectMake(0, 0, kWidth, kHeight) TableViewStyle:UITableViewStyleGrouped cellArray:@[@"RMPOITableViewCell"]];
    self.tableView.rowHeight = RMPOITableViewCellHeight;
}

- (void)configureDelegateAndDataSource{
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.dataSource;
    [self.tableView reloadData];
}

/**
 *  dataBasePath
 */
- (NSString *)dataBasePath:(NSString *)dataBase{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:dataBase];
    return path;
}

- (void)pushAction:(pushButton *)button{
    //跳转传输的数据
    NSString * pushVCStr = button.pushVCStr;
    NSDictionary * dict = @{kDictionaryKeyClass: pushVCStr};
    NotificationPostNotify(KNotificationPushAction, self, dict);
}

#pragma mark - runtime resolve solution
/**
 *  额...解耦竟然让VC没有了实例方法和类方法
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    NSString *instanceMethod = NSStringFromSelector(sel);
    NSLog(@"The instanceMethod name is %@",instanceMethod);
    return YES;
}

+ (BOOL)resolveClassMethod:(SEL)sel{
    NSString *classMethod = NSStringFromSelector(sel);
    NSLog(@"The classMethod is %@",classMethod);
    return YES;
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
