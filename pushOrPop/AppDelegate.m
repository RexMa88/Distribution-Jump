//
//  AppDelegate.m
//  pushOrPop
//
//  Created by RexMa on 15/11/24.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //initializeControllers
    [self initializeControllers];
    //initializeNotifications
    [self initializeNotifications];
    
    return YES;
}

#pragma mark - 初始化界面
- (void)initializeControllers{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    
    ViewController * viewController = [[ViewController alloc] init];
    
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    self.window.rootViewController = navController;
    self.currentNav = navController;
}

#pragma mark - 初始化分发跳转机制

/**
 *  初始化通知
 */
- (void)initializeNotifications{
    NotificationAddObserver(KNotificationPushAction, @selector(pushViewController:));
    NotificationAddObserver(kNotificationPopAction, @selector(popViewController:));
    NotificationAddObserver(kNotificationPopToRootAction, @selector(popToRootViewControllerAnimated:));
}

#pragma mark - 通知处理逻辑

/**
 *  pushViewController Method
 *
 *  @param notification 传递push行为
 *  @notification name
 *  @notification object
 */
- (void)pushViewController:(NSNotification *)notification{
    [self.currentNav pushViewController:[self getViewControllerFromNotification:notification]
                               animated:[self getAnimateFromNotification:notification]];
}

/**
 *  popViewController Method
 *
 *  @param notification 传递Pop行为
 *  默认animated是YES
 */

- (void)popViewController:(NSNotification *)notification{
    //是否有动画
    id animatedObj = [[notification userInfo] objectForKey:kDictionaryKeyAnimated];
    BOOL animated = YES;
    if ([animatedObj isKindOfClass:[NSNumber class]]) {
        animated = [animatedObj boolValue];
    }
    [self.currentNav popViewControllerAnimated:animated];
}

- (void)popToRootViewController:(NSNotification *)notification{
    [self.currentNav popToRootViewControllerAnimated:YES];
}

//是否有动画
- (BOOL)getAnimateFromNotification:(NSNotification *)notification{
    //是否有动画
    id animatedObj = [[notification userInfo] objectForKey:kDictionaryKeyAnimated];
    BOOL animated = YES;
    if ([animatedObj isKindOfClass:[NSNumber class]]) {
        [animatedObj boolValue];
    }
    
    return animated;
}

//获取跳转的控制器界面
- (UIViewController *)getViewControllerFromNotification:(NSNotification *)notification{
    /**
     *  获取notification中的class,SEL等
     */
    id controllerObj = [[notification userInfo] objectForKey:kDictionaryKeyClass];
    //判断controllerObj的性质
    Class controllerClass;
    if ([controllerObj isKindOfClass:[NSString class]]) {
        controllerClass = NSClassFromString(controllerObj);
    }else{
        controllerClass = controllerObj;
    }
    
    BaseViewController * viewController = [[controllerClass alloc] init];
    
    SEL selector = [self selector:[[notification userInfo] objectForKey:kDictionaryKeySelector]];
    id object = [[notification userInfo] objectForKey:kDictionaryKeyObject];
    
    /**
     *  According to the type of object class
     */
    if ([object isKindOfClass:[NSDictionary class]]) {
        viewController.dataDict = (NSDictionary *)object;
    }else if ([object isKindOfClass:[NSArray class]]){
        viewController.dataArray = (NSArray *)object;
    }else if ([object isKindOfClass:[NSString class]]){
        viewController.associateKey = (NSString *)object;
    }
    
    if (selector) {
#pragma clang diagnostic ignored "-Warc-perfomSelectoe-leaks"
        [viewController performSelector:selector withObject:object];
    }
    //记录上一级对应的ViewController
    if ([notification object]) {
        [viewController setSrcControllerClass:[[notification object] class]];
    }
    return viewController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Utils

- (SEL)selector:(id)selectorObj{
    SEL selector;
    if ([selectorObj isKindOfClass:[NSString class]]) {
        selector = NSSelectorFromString(selectorObj);
    }else{
        selector = [selectorObj pointerValue];
    }
    
    return selector;
}

@end
