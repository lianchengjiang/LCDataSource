//
//  LCReusableViewModel.m
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/4.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "LCReusableViewModel.h"

@implementation LCReusableViewModel

#pragma mark - getter
- (NSString *)identifier
{
    if (_identifier) {
        return _identifier;
    }
    _identifier = [self.viewClass description];
    return _identifier;
}

@end
