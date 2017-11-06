//
//  TwoController.m
//  test
//
//  Created by 李洞洞 on 3/11/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "TwoController.h"

@interface TwoController ()

@end

@implementation TwoController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
#if 0  //这么写不能切换
    self.tabBarController.selectedIndex = 0;
#endif
#if 1  //这么写可以切换
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tabBarController.selectedIndex = 0;
        NSLog(@"dispatch_time--%@",[NSRunLoop currentRunLoop]);
    });
#endif
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   // NSLog(@"viewDidAppear--%@",[NSRunLoop currentRunLoop].currentMode);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
     NSLog(@"viewDidLoad--%@",[NSRunLoop currentRunLoop]);
     NSLog(@"************************************************************");

   
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan+++%@",[NSRunLoop currentRunLoop]);
    //self.tabBarController.selectedIndex = 0;
}

@end
