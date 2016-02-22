//
//  RMClient.m
//  pushOrPop
//
//  Created by 马超 on 16/2/14.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import "RMClient.h"
#import "RMWeatherModel.h"

//116.403438,39.92445
#define localWeatherAPI     @"http://api.openweathermap.org/data/2.5/weather?"

#define localHistoricalWeatherAPI @"http://api.openweathermap.org/data/2.5/forecast/daily?"

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

- (RACSignal *)fetchLocalWeatherForLocation:(CLLocationCoordinate2D)coordinate{
    NSString *apiStr = [localWeatherAPI stringByAppendingFormat:@"lat=%@&lon=%@&appid=%@",@(coordinate.latitude),@(coordinate.longitude),OpenWeatherAPIKey];
//    NSString *apiStr = [localWeatherAPI stringByAppendingFormat:@"lat=116.403438&lon=39.92445&appid=%@",OpenWeatherAPIKey];
    NSLog(@"The api is %@",apiStr);
    NSURL *api = [NSURL URLWithString:apiStr];
    return [[self fetchJSONFromURL:api] map:^(NSDictionary *json) {
        RMWeatherModel *weatherModel = [[RMWeatherModel alloc] initWithDic:json];
        return weatherModel;
    }];
}

//- (RACSignal *)fetchLocalHistoricalWeatherForLocation:2(CLLocationCoordinate2D)coordinate{
//    NSString *apiStr = [localHistoricalWeatherAPI stringByAppendingFormat:@"lat=%@&lon=%@&appid=%@",@(coordinate.latitude),@(coordinate.longitude),OpenWeatherAPIKey];
//    NSLog(@"The api is %@",apiStr);
//    NSURL *api = [NSURL URLWithString:apiStr];
//    return [[self fetchJSONFromURL:api] map:^(NSDictionary *json) {
//        
//    }]
//}

@end
