//
//  UIImageView+LXTouch.m
//  TestCategory
//
//  Created by Xu小波 on 2018/12/5.
//  Copyright © 2018年 Xu小波. All rights reserved.
//

#import "UIImageView+LXTouch.h"
#import <objc/runtime.h>

@interface UIImageView ()

@property (nonatomic, strong) UITapGestureRecognizer *lxTouchGr;

@end

@implementation UIImageView (LXTouch)

- (TouchBlock)touchAction {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTouchAction:(TouchBlock)touchAction {
    
    self.userInteractionEnabled = YES;
    
    [self addGestureRecognizer:self.lxTouchGr];
    
    objc_setAssociatedObject(self, @selector(touchAction), touchAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIGestureRecognizer *)lxTouchGr {
    
    UIGestureRecognizer *gr_temp = objc_getAssociatedObject(self, _cmd);
    if (!gr_temp) {
        
        gr_temp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(grTouchAction:)];
        
        objc_setAssociatedObject(self, @selector(lxTouchGr), gr_temp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return gr_temp;
}

- (void)grTouchAction:(UITapGestureRecognizer *)touchGr {
    
    self.touchAction([touchGr locationInView:touchGr.view]);
}

//+ (void)load{
//
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL selA = @selector(touchesBegan:withEvent:);
//        SEL selB = @selector(myTouchesBegan:withEvent:);
//        Method methodA =   class_getInstanceMethod(self,selA);
//        Method methodB = class_getInstanceMethod(self, selB);
//        //将 methodB的实现 添加到系统方法中 也就是说 将 methodA方法指针添加成 方法methodB的  返回值表示是否添加成功
//        BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
//        //添加成功了 说明 本类中不存在methodB 所以此时必须将方法b的实现指针换成方法A的，否则 b方法将没有实现。
//        if (isAdd) {
//            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
//        }else{
//            //添加失败了 说明本类中 有methodB的实现，此时只需要将 methodA和methodB的IMP互换一下即可。
//            method_exchangeImplementations(methodA, methodB);
//        }
//    });
//}
//
//- (void)myTouchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    if (self.touchAction) {
//        
//        UITouch *touch = [touches anyObject];
//        CGPoint point = [touch locationInView:touch.view];
//        
//        self.touchAction(point);
//        
//    }
//    else {
//        
//        if ([self respondsToSelector:@selector(touchesBegan:withEvent:)]) {
//            
//            [self touchesBegan:touches withEvent:event];
//        }
//    }
//}

@end
