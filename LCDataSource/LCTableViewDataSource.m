//
//  LCTableViewDataSource.m
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/3.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "LCTableViewDataSource.h"

@interface LCTableViewDataSource ()

@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, copy) TableViewRemoveRowBlock removeRowBlock;

@end

@implementation LCTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self sectionNumber];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self itemNumberInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCReusableViewModel *item = [self itemAtIndexPath:indexPath];
    
    if (item == nil) {
        return nil;
    }
    
    [tableView registerClass:item.viewClass forCellReuseIdentifier:item.identifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.identifier];
    if (self.configBlock) {
        self.configBlock(cell, item);
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.canEdit;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete && self.canEdit) {
        LCReusableViewModel *item = [self itemAtIndexPath:indexPath];
        [self removeRowAtIndexPath:indexPath inTableView:tableView];
        
        if (self.removeRowBlock) {
            self.removeRowBlock(item);
        }
    }
}

#pragma mark - public
- (void)openSlideRemoveFunctionWithBlock:(TableViewRemoveRowBlock)block;
{
    self.canEdit = YES;
    self.removeRowBlock = block;
}

- (void)removeRowAtIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView
{
    if (!indexPath||!tableView) {
        return;
    }
    [self removeItemAtIndexPath:indexPath];
    
    if ([tableView numberOfRowsInSection:indexPath.section] <= 1) {
        [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
