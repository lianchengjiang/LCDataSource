//
//  LCBaseDataSource.m
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/3.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "LCBaseDataSource.h"
#import "NSArray+Safe.h"

@implementation LCBaseDataSource

#pragma mark - private
- (void)setModelList:(NSArray *)modelList
{
    _modelList = modelList;
    
    _multipleSection = YES;
    for (id item in modelList) {
        if (![item isKindOfClass:[NSArray class]]) {
            _multipleSection = NO;
            break;
        }
    }
}

- (NSUInteger)sectionNumber;
{
    if (self.multipleSection) {
        return self.modelList.count;
    }
    
    if (self.modelList.count > 0) {
        return 1;
    }
    // 如果modelList没有值，返回0;
    return 0;
}

- (NSUInteger)itemNumberInSection:(NSUInteger)section;
{
    if (self.multipleSection) {
        NSArray *rowList = [self.modelList safe_objectAtIndex:section];
        return rowList.count;
    }
    
    return self.modelList.count;
    
}

#pragma mark - public
- (void)configReusableCellWith:(LCConfigureCellBlock)configBlock;
{
    _configBlock = configBlock;
}


#pragma mark -
- (BOOL)removeItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if (!self.multipleSection) {
        NSMutableArray *newModelList = [NSMutableArray arrayWithArray:self.modelList];
        if (newModelList.count <= indexPath.row)     return NO;
        [newModelList removeObjectAtIndex:indexPath.row];
        self.modelList = newModelList;
        return YES;
    }
    
    NSMutableArray *sectionList = [NSMutableArray arrayWithArray:self.modelList];
    if (sectionList.count <= indexPath.section) return NO;
    
    NSMutableArray *rowList = [sectionList[indexPath.section] mutableCopy];
    
    if (rowList.count <= indexPath.row)     return NO;
    [rowList removeObjectAtIndex:indexPath.row];
    
    if (rowList.count == 0) {
        [sectionList removeObjectAtIndex:indexPath.section];
    } else {
        [sectionList replaceObjectAtIndex:indexPath.section withObject:rowList];
    }
    self.modelList = sectionList;
    return YES;
}

- (__kindof LCResuableViewModel *)itemAtIndexPath:(NSIndexPath *)indexPath;
{
    LCResuableViewModel *item;
    if (self.multipleSection) {
        NSArray *rowList = [self.modelList safe_objectAtIndex:indexPath.section];
        item = [rowList safe_objectAtIndex:indexPath.row];
    } else {
        item = [self.modelList safe_objectAtIndex:indexPath.row];
    }
    
    return item;
}

- (NSIndexPath *)indexPathOfModel:(LCResuableViewModel *)item
{
    if (!self.multipleSection) {
        NSUInteger row = [self.modelList indexOfObject:item];
        if (row!=NSNotFound) {
            return [NSIndexPath indexPathForRow:row inSection:0];
        }
        return nil;
    }
    
    for (NSUInteger section = 0; section < self.modelList.count; section++) {
        NSArray *rowList = self.modelList[section];
        NSUInteger row = [rowList indexOfObject:item];
        if (row != NSNotFound) {
            return [NSIndexPath indexPathForRow:row inSection:section];
        }
    }
    return nil;
}


@end
