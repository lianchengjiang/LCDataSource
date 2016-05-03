//
//  LCResuableViewModel.h
//  LCDataSourceExample
//
//  Created by jiangliancheng on 16/5/3.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCResuableViewModel : NSObject

@property (nonatomic, strong) Class viewClass;
@property (nonatomic, copy) NSString *identifier;

@end
