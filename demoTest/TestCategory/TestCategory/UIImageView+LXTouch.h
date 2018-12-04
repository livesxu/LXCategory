//
//  UIImageView+LXTouch.h
//  TestCategory
//
//  Created by Xu小波 on 2018/12/5.
//  Copyright © 2018年 Xu小波. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchBlock)(CGPoint touchPoint);

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (LXTouch)

@property (nonatomic,   copy) TouchBlock touchAction;

@end

NS_ASSUME_NONNULL_END
