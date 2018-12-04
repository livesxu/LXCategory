//
//  UIView+LayerAction.m
//  Shuzan
//
//  Created by Livespro on 2016/12/2.
//  Copyright © 2016年 FZ. All rights reserved.
//

#import "UIView+LayerAction.h"

@implementation UIView (LayerAction)

- (void)setRadius:(CGFloat)radius
      borderWidth:(CGFloat)borderWidth
      borderColor:(UIColor *)borderColor
{
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = radius;
}

- (void)setClearRadius:(CGFloat)radius{
    
    [self setRadius:radius borderWidth:0 borderColor:[UIColor clearColor]];
}

@end
