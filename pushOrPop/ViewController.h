//
//  ViewController.h
//  pushOrPop
//
//  Created by RexMa on 15/11/24.
//  Copyright © 2015年 RexMa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"

/**
 *  这次改版主要是针对BaseTableViewController，把DataSource和Delegate的权限放到每一个继承自BaseTableViewController的子控制器当中，这样加强了子控制器的管理权限，并且在BaseTableViewController中使用NS_DESIGNATED_INITIALIZER指认了初始化方法。NS_DESIGNATED_INITIALIZER的讲解放在了http://www.blackaile.com/2016/01/07/NS_DESIGNATED_INITIALIZER/
 */

@interface ViewController : BaseTableViewController

@end

