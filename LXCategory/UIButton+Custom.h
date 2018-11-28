//
//  UIButton+Custom.h
//  XiaoLiuRetail
//
//  Created by imac on 15/11/16.
//  Copyright © 2015年 福中. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Custom)

/**
 bgImage + title btn

 @param frame frame
 @param title title
 @param font font
 @param tc TitleColor
 @param image BackgroundImage
 @return btn
 */
+ (UIButton *)buttonWithNomalFrame:(CGRect)frame
                             Title:(NSString *)title
                         TitleFont:(UIFont *)font
                        TitleColor:(UIColor *)tc
                   BackgroundImage:(UIImage *)image;

/**
 image btn

 @param frame frame
 @param image image
 @return btn
 */
+ (UIButton *)buttonWithNomalFrame:(CGRect)frame
                             Image:(UIImage *)image;

/**
 title btn

 @param frame frame
 @param title title
 @param font font
 @param tc TitleColor
 @param color BackgroundColor
 @return btn
 */
+ (UIButton *)buttonWithNomalFrame:(CGRect)frame
                             Title:(NSString *)title
                         TitleFont:(UIFont *)font
                        TitleColor:(UIColor *)tc
                   BackgroundColor:(UIColor *)color;

/**
 qk config btn

 @param frame frame
 @param configDic configs
 @return btn
 */
- (instancetype)initWithFrame:(CGRect)frame
                       Config:(NSDictionary *)configDic;

@end
