//
//  RMCellHeaderView.h
//  pushOrPop
//
//  Created by Rex Ma on 15/12/24.
//  Copyright © 2015年 RexMa. All rights reserved.
//

/**
 *  This is a custom cell headerView like Wechat friendCircle head portrait，Sina weibo head portrait，and it based
 *  on self-manager and link:http://blog.sunnyxx.com/2015/12/19/self-manager-pattern-in-ios/
 *  这是一个自定义的视图，主要使用在微信朋友圈、新浪微博的头像方便更加的管理。这个理念的起源于上面的链接.
 */

#import <UIKit/UIKit.h>

@interface RMCellHeaderView : UIView

@property (nonatomic, strong) UIImageView *headerImageView;//头像

- (void)configureImageURL:(NSURL *)url tapped:(void (^)(void))block;

@end
