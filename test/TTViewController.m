//
//  TTViewController.m
//  test
//
//  Created by 李洞洞 on 13/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "TTViewController.h"

@interface TTViewController ()

@end

@implementation TTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)dealloc
{
    NSLog(@"TTViewController---Dealloc...");
}
@end
