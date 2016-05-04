//
//  LCReusableViewModel.h
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/4.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCReusableViewModel : NSObject

@property (nonatomic, strong) Class viewClass;
@property (nonatomic, copy) NSString *identifier;

@end
