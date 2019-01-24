//
//  UIImageView+CustomChainTest.h
//  CategoryDemo
//
//  Created by Xu小波 on 2019/1/24.
//  Copyright © 2019年 Xu小波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (CustomChainTest)

//演示对扩展属性添加链式方法
@property (nonatomic,   copy) NSString *test1P;

- (UIImageView * _Nonnull (^)(NSString * ))lx_test1P;


//对子类属性添加链式方法
- (UIImageView * _Nonnull (^)(NSString * ))lx_test2P;

- (UIImageView * _Nonnull (^)(CGSize ))lx_touthChnageSize;

@end

NS_ASSUME_NONNULL_END
