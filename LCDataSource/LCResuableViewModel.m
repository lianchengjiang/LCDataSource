//
//  LCResuableViewModel.m
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/3.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "LCResuableViewModel.h"

@implementation LCResuableViewModel

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
