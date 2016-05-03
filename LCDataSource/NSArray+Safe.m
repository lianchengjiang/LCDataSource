//
//  NSArray+Safe.m
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/3.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)

- (id)safe_objectAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        return [self objectAtIndex:index];
    }
    
    return nil;
}
@end
