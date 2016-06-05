//
//  LCTableViewDataSource.h
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/3.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LCBaseDataSource.h"

typedef void(^TableViewRemoveRowBlock)(__kindof LCReusableViewModel *viewModel);

@interface LCTableViewDataSource : LCBaseDataSource<UITableViewDataSource>

- (void)openSlideRemoveFunctionWithBlock:(TableViewRemoveRowBlock)block;
- (void)removeRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

@end
