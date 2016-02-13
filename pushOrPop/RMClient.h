//
//  RMClient.h
//  pushOrPop
//
//  Created by 马超 on 16/2/14.
//  Copyright © 2016年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface RMClient : NSObject

- (RACSignal *)fetchDataFromURL:(NSURL *)url;

@end
