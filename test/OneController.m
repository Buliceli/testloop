//
//  OneController.m
//  test
//
//  Created by 李洞洞 on 3/11/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "OneController.h"

@interface OneController ()

@end

@implementation OneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"%s---%@",__func__,[NSRunLoop currentRunLoop].currentMode);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%s----%@",__func__,[NSRunLoop currentRunLoop].currentMode);
}

@end
