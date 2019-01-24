//
//  UIImageView+CustomChainTest.m
//  CategoryDemo
//
//  Created by Xu小波 on 2019/1/24.
//  Copyright © 2019年 Xu小波. All rights reserved.
//

#import "UIImageView+CustomChainTest.h"

#import <objc/runtime.h>

#import "NSObject+Chain_lx.h"

@implementation UIImageView (CustomChainTest)

//动态添加 test1P 属性
- (void)setTest1P:(NSString *)test1P {
    
    objc_setAssociatedObject(self, @selector(test1P), test1P, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)test1P {
    
    return objc_getAssociatedObject(self, _cmd);
}


//链式方法指定关联
+ (NSDictionary *)customChainDictionary {
    
    return @{@"lx_test1P":@"id",
             @"lx_test2P":@"id",
             @"lx_touthChnageSize":@"size",
             };
}

@end
