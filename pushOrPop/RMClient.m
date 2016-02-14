//
//  RMClient.m
//  pushOrPop
//
//  Created by 马超 on 16/2/14.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMClient.h"

#define localWeatherAPI     @"http://api.openweathermap.org/data/2.5/weather?"

@interface RMClient ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation RMClient

- (instancetype)init{
    self = [super init];
    
    if (self) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    
    return self;
}

- (RACSignal *)fetchJSONFromURL:(NSURL *)url{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                NSError *jsonError = nil;
                id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                if (!jsonError) {
                    [subscriber sendNext:json];
                }else{
                    [subscriber sendError:jsonError];
                }
            }else{
                [subscriber sendError:error];
            }
            
            [subscriber sendCompleted];
        }];
        
        [dataTask resume];
        
        return [RACDisposable disposableWithBlock:^{
            [dataTask cancel];
        }];
    }] doError:^(NSError *error) {
        NSLog(@"The error is %@",error);
    }];
}

//- (RACSignal *)fetchLocalWeatherForLocation:(CLLocationCoordinate2D)coordinate{
//    NSString *apiStr = [localWeatherAPI stringByAppendingFormat:@"lat=%@&lon=%@&appid=%@",@(coordinate.latitude),@(coordinate.longitude),OpenWeatherAPIKey];
//    NSLog(@"The api is %@",apiStr);
//    NSURL *api = [NSURL URLWithString:apiStr];
//    return [[self fetchJSONFromURL:api] map:^(NSDictionary *json) {
//        
//    }];
//}

@end
