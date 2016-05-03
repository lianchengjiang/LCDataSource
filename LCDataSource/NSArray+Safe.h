//
//  NSArray+Safe.h
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/3.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Safe)

- (id)safe_objectAtIndex:(NSUInteger)index;

@end
