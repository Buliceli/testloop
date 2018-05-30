//
//  LDController.m
//  test
//
//  Created by 李洞洞 on 25/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "LDController.h"
#import "MJExtension.h"
#import "CityModel.h"
#import "Person.h"
#import "UIButton+ldd.h"
#import "LDButton.h"
#import "LDString.h"

#import "City.h"
#import "QuXian.h"
#import "School.h"
#import "NSObject+Prepory.h"
#import "FirstCity.h"

#import "LDD.h"
#import "ZHDL.h"
@interface LDController ()
{
    NSMachPort * _port;
    NSRunLoop  * _currentRunLoop;
}
@property(nonatomic,strong)NSMutableArray * modelArr;
@property(nonatomic,strong)NSMutableArray * cityArr;
@property(nonatomic,strong)NSMutableArray * quXianArr;
@property(nonatomic,strong)NSMutableArray * schoolArr;
@property(nonatomic,strong)NSThread * ldThred;

@end
@implementation LDController
/*
 extern工作原理:
 先在当前文件查找有没有全局变量，没有找到，才会去其他文件查找。
 全局变量：只有一份内存，所有文件共享，与extern联合使用。
 NSLog(@"%d",a);
 a = 20;
 NSLog(@"%d",a);
 与NSUserDefault比 不具有保存值的作用因为每次AppDelegate.m里每次启动动重新赋值
 */

extern int a;

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //字典转模型
    NSArray * arr = @[
               @{
                   @"shiName":@"南京市",
                   @"id":@"1",
                   @"shiArr":@[
                             @{
                               @"name":@"高淳区",
                               @"arr":@[
                                       @{@"schoolName":@"高淳_第一小学"},
                                       @{@"schoolName":@"高淳_第二小学"}
                                       ]
                               
                               },
                           
                           @{
                               @"name":@"江宁区",
                               @"arr":@[
                                       @{@"schoolName":@"江宁_第一小学"},
                                       @{@"schoolName":@"江宁_第二小学"}
                                       ]
                               }],
                   
                   },
               @{
                   @"shiName":@"无锡市",
                   @"id":@"2",
                   @"shiArr":@[
                           @{
                               @"name":@"宜兴市",
                               @"arr":@[
                                       @{@"schoolName":@"宜兴_第一小学"},
                                       @{@"schoolName":@"宜兴_第二小学"}
                                       ]
                               
                               },
                           
                           @{
                               @"name":@"江阴市",
                               @"arr":@[
                                       @{@"schoolName":@"江阴_第一小学"},
                                       @{@"schoolName":@"江阴_第二小学"}
                                       ]
                               }],
                   
                   }
               ];
   

    
//    NSArray * arr = @[
//                      @{
//                          @"shiName":@"南京市",
//                          @"id" : @"99",
//                          @"shiArr":
//                                    @[
//                                      @{@"name":@"高淳区"},
//                                     ]
//                          
//                          }];
    for (NSDictionary * dict in arr) {
        FirstCity * city = [FirstCity modelWithDict:dict];
        for (QuXian * qu in city.shiArr) {
            NSLog(@"区name= +++%@+++",qu.name);
        }
        NSLog(@"城市ID = +++%@+++",city.ID);
    }
    
}


/*
 _ldThred = [[NSThread alloc]initWithTarget:self selector:@selector(ldTest) object:nil];
 _ldThred.name = @"常驻";
 [_ldThred start];
 UIButton * btnn = ({
 UIButton * btn = [[UIButton alloc]init];
 btn.backgroundColor = [UIColor lightGrayColor];
 [btn setTitle:@"退出当前RunLoop" forState:UIControlStateNormal];
 [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
 CGRect rect = btn.frame;
 rect.origin = CGPointMake(50, 100);
 rect.size = CGSizeMake(200, 100);
 btn.frame = rect;
 btn;
 });
 [self.view addSubview:btnn];
 */
- (void)btnClick
{
    [self performSelector:@selector(ldThredBtnClick) onThread:_ldThred withObject:nil waitUntilDone:NO];
    // [NSThread exit];
    
}
- (void)ldThredBtnClick
{
    NSLog(@"Btn的点击事件在%@中处理",[NSThread currentThread]);
    [_currentRunLoop removePort:_port forMode:NSDefaultRunLoopMode];
}
- (void)ldTest
{
    _port = (NSMachPort*)[NSMachPort port];
    _currentRunLoop = [NSRunLoop currentRunLoop];
    
    [_currentRunLoop addPort:_port forMode:NSDefaultRunLoopMode];
    [_currentRunLoop run];
  
    
    
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self performSelector:@selector(ld_test) onThread:_ldThred withObject:nil waitUntilDone:NO];
//}
//- (void)ld_test
//{
//    NSLog(@"+++%@+++",[NSThread currentThread]);
//}


/*
 #if 0
 #pragma mark -- 交换方法
 NSArray * arr = @[@"1",@"2"];
 NSMutableArray * mutArr = [NSMutableArray arrayWithArray:arr];
 NSLog(@"%@",mutArr[10]);
 #endif
 #if 0
 #pragma mark -- 动态添加方法
 Person * p = [[Person alloc]init];
 //[p eat]; //编译不过
 [p performSelector:@selector(eat) withObject:nil];//编译的过 运行崩
 #endif
 #if 0
 #pragma mark -- 动态添加属性
 UIButton * btn = [[UIButton alloc]init];
 btn.ld_Title = @"ldd";
 NSLog(@"%@",btn.ld_Title);
 btn.ld_Title = @"999";
 NSLog(@"%@",btn.ld_Title);
 #endif
 #if 1
 #pragma mark --
 
 
 - (NSMutableArray *)modelArr
 {
 if (!_modelArr) {
 _modelArr = [NSMutableArray array];
 }
 return _modelArr;
 
 }
 - (NSMutableArray *)cityArr
 {
 if (!_cityArr) {
 _cityArr = [NSMutableArray array];
 }
 return _cityArr;
 
 }
 - (NSMutableArray *)quXianArr
 {
 if (!_quXianArr) {
 _quXianArr = [NSMutableArray array];
 }
 return _quXianArr;
 
 }
 - (NSMutableArray *)schoolArr
 {
 if (!_schoolArr) {
 _schoolArr = [NSMutableArray array];
 }
 return _schoolArr;
 
 }
 - (id)toArrayOrNSDictionary:(NSData *)jsonData{
 
 NSError *error = nil;
 id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
 options:NSJSONReadingAllowFragments
 error:nil];
 
 if (jsonObject != nil && error == nil){
 return jsonObject;
 }else{
 // 解析错误
 return nil;
 }
 
 }

 
 #endif
 */
/**
 根据cityName返回所有区县
 */
- (NSSet*)returnQuXian:(NSString *)cityName
{
    /*
     return;
     self.view.backgroundColor = [UIColor lightGrayColor];
     NSString * path = [[NSBundle mainBundle]pathForResource:@"City" ofType:@"plist"];
     self.modelArr = [CityModel mj_objectArrayWithFile:path];
     for (CityModel * model in self.modelArr) {
     [self.cityArr addObject:model.state];
     }
     NSMutableArray * resultArr = [NSMutableArray array];
     for (NSString * str in self.cityArr) {
     if (![resultArr containsObject:str]) {
     [resultArr addObject:str];
     }
     }
     NSLog(@"%@",resultArr);
     */
    NSMutableArray * modelArr = [NSMutableArray array];
    for (CityModel * model in self.modelArr) {
        if ([model.state isEqualToString:cityName]) {
            [self.quXianArr addObject:model];
            [modelArr addObject:model];
        }
    }
    NSSet *set = [NSSet setWithArray:modelArr];
    return set;
}
/**
 返回所有的学校
 */
- (NSSet*)returnAllSchool:(NSString*)cityName quXian:(NSString*)qu
{
    NSMutableArray * modelArr = [NSMutableArray array];
    for (CityModel * model in self.modelArr) {
        if ([model.state isEqualToString:cityName]&&[model.city isEqualToString:qu]) {
            [self.quXianArr addObject:model];
            [modelArr addObject:model];
        }
    }
    NSSet *set = [NSSet setWithArray:modelArr];
    return set;
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//#if 0
//    NSSet * set =  [self returnQuXian:@"苏州市"];
//#endif
//    NSSet * set =  [self returnAllSchool:@"苏州市" quXian:@"昆山市"];
//    NSMutableSet *set1 = [NSMutableSet set];
//    for (CityModel * model in set) {
//        [set1 addObject:model.school];
//    }
//    for (NSString * str in set1) {
//        NSLog(@"%@",str);
//        NSLog(@"%lu",(unsigned long)set1.count);
//    }
//
//}


/*
 NSString * path1 = [[NSBundle mainBundle]pathForResource:@"996" ofType:@"json"];
 //    NSString * str = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
 NSData * data = [NSData dataWithContentsOfFile:path1];
 NSArray * arr = [self toArrayOrNSDictionary:data];
 [arr writeToFile:@"/Users/lidongdong/Desktop/City.plist" atomically:YES];
 return;
 */
@end
