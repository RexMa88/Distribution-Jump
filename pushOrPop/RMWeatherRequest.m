//
//  RMWeatherRequest.m
//  pushOrPop
//
//  Created by 马超 on 16/2/13.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMWeatherRequest.h"

@interface RMWeatherRequest ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation RMWeatherRequest

+ (instancetype)shareManager{
    static RMWeatherRequest *_shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[RMWeatherRequest alloc] init];
    });
    
    return _shareManager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfig];
    }
    return self;
}

//- (RACSignal *)fetchDataFromURL:(NSURL *)url{
//    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//            if (!error) {
//                NSError *jsonError = nil;
//                
//                id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
//                if (!jsonError) {
//                    [subscriber sendNext:json];
//                }else{
//                    [subscriber sendError:jsonError];
//                }
//            }else{
//                [subscriber sendError:error];
//            }
//            
//            [subscriber sendCompleted];
//        }];
//        
//        [dataTask resume];
//        
//        return [RACDisposable disposableWithBlock:^{
//            [dataTask cancel];
//        }];
//    }] doError:^(NSError *error) {
//        NSLog(@"The error is %@",[error description]);
//    }];
//}

@end
