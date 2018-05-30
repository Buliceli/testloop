//
//  RunController.m
//  test
//
//  Created by 李洞洞 on 27/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "RunController.h"
#import <objc/runtime.h>
@interface RunController ()
@end
@implementation RunController
static char * const LD_Key = "Key";
static char * const LD_ButtonKey = "ButtonKey";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * button = ({
        UIButton * btn = [[UIButton alloc]init];
        objc_setAssociatedObject(btn, LD_ButtonKey, @"6666", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        btn;
    });
    [self.view addSubview:button];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@",objc_getAssociatedObject(button, LD_ButtonKey));
    });

    
    
    UIView * view1 = ({
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
        view.backgroundColor = [UIColor redColor];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view1Click:)];
        NSDictionary * value= @{@"color":[UIColor greenColor]};
        objc_setAssociatedObject(view, LD_Key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [view addGestureRecognizer:tap];
        view;
    });
    [self.view addSubview:view1];
}
- (void)view1Click:(UITapGestureRecognizer*)tap
{
    UIView * view = tap.view;
    NSDictionary *value = objc_getAssociatedObject(view, LD_Key);
    view.backgroundColor = value[@"color"];
}
/*
 UIView * view2 = ({
 UIView * view = [[UIView alloc]initWithFrame:CGRectMake(150, 10, 100, 100)];
 view.backgroundColor = [UIColor lightGrayColor];
 UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view2Click)];
 [view addGestureRecognizer:tap];
 view;
 });
 [self.view addSubview:view2];
 - (void)view2Click
 {
 
 }
 */

@end
