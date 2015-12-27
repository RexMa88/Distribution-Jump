//
//  RMBaseModel.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/27.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+NullReplace.h"

@interface RMBaseModel : NSObject

@end

@interface NSObject(DictionaryToModel)
/**
 *  Convert Dictionary to Model
 *
 *  @param dict Dictionary
 *
 *  @return model
 */
- (id)initWithDic:(NSDictionary *)dict;
/**
 *  The list of properties
 *
 */
- (NSArray *)propertyList;
/**
 *  Convert Dictionary to model,and change value
 *
 */
- (void)changeValuesWithDic:(NSDictionary *)dict;

@end
