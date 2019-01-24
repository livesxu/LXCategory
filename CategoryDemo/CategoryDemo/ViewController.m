//
//  ViewController.m
//  CategoryDemo
//
//  Created by Xu小波 on 2019/1/24.
//  Copyright © 2019年 Xu小波. All rights reserved.
//

#import "ViewController.h"

#import "LXCategorys.h"

#import "UIImageView+CustomChainTest.h"

#import "ImageViewCustomChainTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //链式
    UIButton *btn = UIButton.alloc.init.lx_backgroundColor([UIColor greenColor]).lx_frame(CGRectMake(10, 20, 100, 100));
    
    [self.view addSubview:btn];
    
    //touch
    [btn lx_addActionTouchWithBlock:^(UIControl * _Nonnull sender) {
        
        NSLog(@"touch - btn");
    }];
    
    UIImageView *imgView = UIImageView.alloc.init.lx_frame(CGRectMake(200, 200, 50, 50)).lx_backgroundColor([UIColor redColor]);
    
    [self.view addSubview:imgView];
    
    [imgView lx_addActionWithBlock:^(UIView *sender, CGPoint touchPoint) {
        
        NSLog(@"touch - imgView");
    }];
    
    
    ImageViewCustomChainTest *imgViewTest = (ImageViewCustomChainTest *)ImageViewCustomChainTest.alloc.init.lx_frame(CGRectMake(200, 400, 50, 50)).lx_backgroundColor([UIColor blueColor]).lx_test1P(@"111").lx_test2P(@"222").lx_touthChnageSize(CGSizeMake(100, 100));
    
    [self.view addSubview:imgViewTest];
    
    [imgViewTest lx_addActionWithBlock:^(UIView *sender, CGPoint touchPoint) {
        
        ImageViewCustomChainTest *ins = (ImageViewCustomChainTest *)sender;
        
        CGRect frame = ins.frame;
        
        frame.size = ins.touthChnageSize;
        
        ins.frame = frame;
        
        NSLog(@"touch - imgView %@  %@",ins.test1P,ins.test2P);
    }];
}


@end
