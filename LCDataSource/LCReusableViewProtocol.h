//
//  LCReusableViewProtocol.h
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/6/9.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCReusableViewModel.h"


@protocol LCReusableViewProtocol <NSObject>

- (void)updateUIWithCellModel:(LCReusableViewModel *)model;

@end
