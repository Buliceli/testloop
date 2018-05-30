//
//  OneController.m
//  test
//
//  Created by 李洞洞 on 3/11/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "OneController.h"
#import "ThreeViewController.h"
#import "OneSubViewController.h"
@interface OneController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@end

@implementation OneController
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.navigationController.navigationBar.translucent = NO;
    //self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    
    [self.view addSubview:self.tableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OneSubViewController * one = [[OneSubViewController alloc]init];
    [self.navigationController pushViewController:one animated:YES];
}



















































#if 0
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ThreeViewController * three = [[ThreeViewController alloc]init];
    [self presentViewController:three animated:YES completion:nil];
}
#endif
@end
