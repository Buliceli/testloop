//
//  RegisterController.m
//  test
//
//  Created by 李洞洞 on 20/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//
#import "RegisterCell.h"
#import "RegisterController.h"
#import "TPKeyboardAvoidingTableView.h"
@interface RegisterController ()<UITableViewDataSource>
@property(nonatomic,strong)TPKeyboardAvoidingTableView * tableView;
@end

@implementation RegisterController
- (TPKeyboardAvoidingTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[TPKeyboardAvoidingTableView alloc]initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width - 0, 300) style:UITableViewStylePlain];

        _tableView.backgroundColor = [UIColor brownColor];
        _tableView.dataSource = self;
        [_tableView registerClass:[RegisterCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.tableView];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RegisterCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}

@end
