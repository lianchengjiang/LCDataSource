//
//  LCBaseDataSource.h
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/3.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LCReusableViewModel.h"

typedef void (^LCConfigureCellBlock)(__kindof UIView *cell,__kindof LCReusableViewModel * viewModel);


@interface LCBaseDataSource : NSObject

// 当modelList 存的是数组时，默认为每个数组是个section
@property (nonatomic, assign, readonly) BOOL multipleSection;

@property (nonatomic, copy) NSArray *modelList;  // item must be kind of LCArrowCellModel

// set config block
- (void)setExtraConfigCellBlock:(LCConfigureCellBlock)configBlock;


// invoke config block 
- (void)configCell:(UIView *)cell withModel:(LCReusableViewModel *)model;

- (NSUInteger)sectionNumber;
- (NSUInteger)itemNumberInSection:(NSUInteger)section;

- (BOOL)removeItemAtIndexPath:(NSIndexPath *)indexPath;
- (__kindof LCReusableViewModel *)itemAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)indexPathOfModel:(LCReusableViewModel *)model;

@end
