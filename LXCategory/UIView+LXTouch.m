//
//  UIImageView+LXTouch.m
//  TestCategory
//
//  Created by Xu小波 on 2018/12/5.
//  Copyright © 2018年 Xu小波. All rights reserved.
//

#import "UIView+LXTouch.h"
#import <objc/runtime.h>

static const int gr_key;
static const int action_key;

@implementation UIView (LXTouch)

- (TouchBlock)touchAction {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTouchAction:(TouchBlock)touchAction {
    
    self.userInteractionEnabled = YES;
    
    [self addGestureRecognizer:[self lxTouchGr]];
    
    objc_setAssociatedObject(self, @selector(touchAction), touchAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITapGestureRecognizer *)lxTouchGr {
    
    UITapGestureRecognizer *gr_temp = objc_getAssociatedObject(self, &gr_key);
    if (!gr_temp) {
        
        gr_temp = [[UITapGestureRecognizer alloc]init];
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        LXTargetBlockItem *actionItem = objc_getAssociatedObject(self, &action_key);
        if (!actionItem) {
            //添加方法
            class_addMethod([LXTargetBlockItem class], @selector(view_gr_invoke:), (IMP)view_gr_invoke, "v@:@");
            
            actionItem = [[LXTargetBlockItem alloc]init];
            __weak typeof(self) weakSelf = self;
            actionItem.block = ^(id selInfo) {
                __strong __typeof(weakSelf) strongSelf = weakSelf;
                UITapGestureRecognizer *touchGr = selInfo;
                strongSelf.touchAction(touchGr.view,[touchGr locationInView:touchGr.view]);
            };
            objc_setAssociatedObject(self, &action_key, actionItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        [gr_temp addTarget:actionItem action:@selector(view_gr_invoke:)];
#pragma clang diagnostic pop
        
        objc_setAssociatedObject(self, &gr_key, gr_temp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return gr_temp;
}

void view_gr_invoke(id self, SEL _cmd, id sender) {
    
    LXTargetBlockItem *self_temp = self;
    
    if (self_temp.block) {
        
        self_temp.block(sender);
    }
}

@end

@implementation LXTargetBlockItem

@end
