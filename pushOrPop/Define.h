//
//  Define.h
//  pushOrPop
//
//  Created by RexMa on 15/11/26.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#ifndef Define_h
#define Define_h

//跳转界面参数
#define kDictionaryKeyAnimated                      @"animated"
#define kDictionaryKeyClass                         @"class"
#define kDictionaryKeySelector                      @"selector"
#define kDictionaryKeyObject                        @"object"
#define kDictionaryKeySelectorBackground            @"backgroundRun"
#define kDictionaryKeyAnotherSelector               @"anoterSelector"
#define kDictionaryKeyAnotherObject                 @"anotherObject"
#define kDictionaryKeyAnotherSelectorBackground     @"anotherbackgroundRun"
//显示高度与宽度
#define kWidth                              [[UIScreen mainScreen] bounds].size.width
#define kHeight                             [[UIScreen mainScreen] bounds].size.height
#define kScreenBounds                       [UIScreen mainScreen].bounds
//The Key of dataDict
#define kDataArrayKey                       @"dataArrayKey"
#define kTableViewDataKey                   @"tableViewDataKey"
//The key of TableViewCell ReuseIdentifier
#define kTableViewReuseIdentifier           @"TableViewReuseIdentifier"
#define kTableViewCellStr                   @"TableViewCell"

#endif /* Define_h */
