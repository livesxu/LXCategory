//
//  ViewController.m
//  TestCategory
//
//  Created by Xu小波 on 2018/12/4.
//  Copyright © 2018年 Xu小波. All rights reserved.
//

#import "ViewController.h"

#import "LXCategorys.h"

#import "UIImageView+LXTouch.h"

#import "SubImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSInteger i = lxStateHeight;
    
    bool isIphone = lxIsPhoneX;
    
    NSLog(@"111");
    
    SubImageView *imgV = [[SubImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imgV.backgroundColor = [UIColor redColor];
    imgV.userInteractionEnabled = YES;
    imgV.touchAction = ^(CGPoint touchPoint) {
        
        NSLog(@"222");
    };
    
    [self.view addSubview:imgV];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
