//
//  UIImageView+LXTouch.h
//  TestCategory
//
//  Created by Xu小波 on 2018/12/5.
//  Copyright © 2018年 Xu小波. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchBlock)(UIView *sender,CGPoint touchPoint);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LXTouch)

//添加手势添加的操作方法
@property (nonatomic,   copy) TouchBlock touchAction;

@end


typedef void(^LXTargetBlock)(id selInfo);

@interface LXTargetBlockItem : NSObject

@property (nonatomic,  copy) LXTargetBlock block;

@end

NS_ASSUME_NONNULL_END
