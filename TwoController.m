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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
}














































#if 0
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
#if 0  //这么写不能切换
    self.tabBarController.selectedIndex = 0;
#endif
#if 0  //这么写可以切换
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tabBarController.selectedIndex = 0;
        NSLog(@"dispatch_time--%@",[NSRunLoop currentRunLoop]);
    });
#endif
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
}
#endif
@end
