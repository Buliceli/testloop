//
//  TestController.m
//  test
//
//  Created by 李洞洞 on 9/11/17.
//  Copyright © 2017年 Minte. All rights reserved.
//
#import "TestController.h"
#import "MJExtension.h"
#import "SchoolModel.h"
#import "QuXianModel.h"
#import "ShiModel.h"
#import "LDAlertView0.h"
#import "masonry.h"
@interface TestController ()<UITextFieldDelegate>
@property(nonatomic,strong)NSDictionary * dict;
@property(nonatomic,strong)NSArray * array;
@property(nonatomic,strong)UIScrollView * bgScrollView;
@property(nonatomic,strong)UITextField * frameTF;
@property(nonatomic,assign)CGFloat  distance;
@property(nonatomic,assign)CGRect  tfRect;
@end

@implementation TestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
   
    

    
   
    //return;
    [self setUpUI];
    //return;
    _array = @[
             @{
               @"shiName":@"南京市",
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

    NSString * path = [[NSBundle mainBundle]pathForResource:@"2222" ofType:@"json"];
    NSString * str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray * lddArr = [self stringToJSON:str];
//    BOOL success =  [lddArr writeToFile:@"/Users/lidongdong/Desktop/Bu.plist" atomically:YES];
//    NSLog(@"+++%d+++",success);
 
}
- (NSArray *)stringToJSON:(NSString *)jsonStr {
    if (jsonStr) {
        id tmp = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers error:nil];
        
        if (tmp) {
            if ([tmp isKindOfClass:[NSArray class]]) {
                
                return tmp;
                
            } else if([tmp isKindOfClass:[NSString class]]
                      || [tmp isKindOfClass:[NSDictionary class]]) {
                
                return [NSArray arrayWithObject:tmp];
                
            } else {
                return nil;
            }
        } else {
            return nil;
        }
        
    } else {
        return nil;
    }
}
//    NSString * str = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_array options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",str);
 //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
- (void)setUpUI
{
    UILabel * titleLabel = ({
        UILabel * label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor lightGrayColor];
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:17];
        label.textColor = [UIColor redColor];
        label.text = @"说明:用户名为4-16位字符(字母、数字组合),设置后不可更改 密码为8-16位字母、数字组合";
        label;
    });
    [self.view addSubview:titleLabel];
    CGFloat textH = [titleLabel.text boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height;
    CGFloat margin = 10;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(margin);
        make.top.mas_offset(margin);
        make.right.mas_offset(-margin);
        make.height.mas_equalTo(textH+1);
    }];
    [self.view layoutIfNeeded];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    //CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    _bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(titleLabel.frame)+ margin + 100, screenW- 2*margin, 300)];
    UIView * containerView = [[UIView alloc]init];
    containerView.backgroundColor = [UIColor redColor];
    [_bgScrollView addSubview:containerView];
    _bgScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_bgScrollView];
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
        //make.height.mas_equalTo(800);
        make.centerX.mas_offset(0);
    }];
    _bgScrollView.contentSize = CGSizeMake(containerView.bounds.size.width, containerView.bounds.size.height);
#pragma mark -- 用户名
    UILabel * userL = ({
        UILabel * label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor cyanColor];
        label.textAlignment = NSTextAlignmentRight;
        label.text = @"用户名:";
        label;
    });
    [containerView addSubview:userL];
    [userL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_offset(margin);
        make.height.mas_equalTo(3*margin);
        make.width.mas_equalTo(8*margin);
    }];
    UITextField * userTF = ({
        UITextField * tf = [[UITextField alloc]init];
        tf.delegate = self;
        self.frameTF = tf;
        tf.borderStyle = UITextBorderStyleLine;
        tf;
    });
    [containerView addSubview:userTF];
    [userTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userL.mas_right).mas_offset(margin * 0.5);
        make.centerY.mas_equalTo(userL.mas_centerY);
        make.right.mas_offset(-margin);
        make.height.mas_equalTo(userL);
    }];
#pragma mark -- 身份证号
    UILabel * idNum = ({
        UILabel * label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.backgroundColor = [UIColor cyanColor];
        label.text = @"身份证号:";
        label;
    });
    [containerView addSubview:idNum];
    [idNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userL);
        make.top.mas_equalTo(userL.mas_bottom).mas_offset(margin);
        make.width.and.height.mas_equalTo(userL);
    }];
    UITextField * idTF = ({
        UITextField * tf = [[UITextField alloc]init];
        self.frameTF = tf;
        tf.borderStyle = UITextBorderStyleLine;
        tf;
    });
    [containerView addSubview:idTF];
    [idTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userTF);
        make.width.and.height.mas_equalTo(userTF);
        make.top.mas_equalTo(userTF.mas_bottom).mas_offset(margin);
    }];
#pragma mark -- 学籍辅号
    UILabel * schoolNum = ({
        UILabel * label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.backgroundColor = [UIColor cyanColor];
        label.text = @"身份证号:";
        label;
    });
    [containerView addSubview:schoolNum];
    [schoolNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userL);
        make.top.mas_equalTo(idNum.mas_bottom).mas_offset(margin);
        make.width.and.height.mas_equalTo(userL);
    }];
    UITextField * schoolTF = ({
        UITextField * tf = [[UITextField alloc]init];
        self.frameTF = tf;
        tf.borderStyle = UITextBorderStyleLine;
        tf;
    });
    [containerView addSubview:schoolTF];
    [schoolTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userTF);
        make.width.and.height.mas_equalTo(userTF);
        make.top.mas_equalTo(idTF.mas_bottom).mas_offset(margin);
    }];
#pragma mark -- 姓名
    UILabel * nameL = ({
        UILabel * label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.backgroundColor = [UIColor cyanColor];
        label.text = @"姓名:";
        label;
    });
    [containerView addSubview:nameL];
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userL);
        make.top.mas_equalTo(schoolNum.mas_bottom).mas_offset(margin);
        make.width.and.height.mas_equalTo(userL);
    }];
    UITextField * nameTF = ({
        UITextField * tf = [[UITextField alloc]init];
        self.frameTF = tf;
        tf.borderStyle = UITextBorderStyleLine;
        tf;
    });
    [containerView addSubview:nameTF];
    [nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userTF);
        make.width.and.height.mas_equalTo(userTF);
        make.top.mas_equalTo(schoolTF.mas_bottom).mas_offset(margin);
    }];
#pragma mark -- 地市
    UILabel * cityL = ({
        UILabel * label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.backgroundColor = [UIColor cyanColor];
        label.text = @"地市:";
        label;
    });
    [containerView addSubview:cityL];
    [cityL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userL);
        make.top.mas_equalTo(nameL.mas_bottom).mas_offset(margin);
        make.width.and.height.mas_equalTo(userL);
    }];
    UITextField * cityTF = ({
        UITextField * tf = [[UITextField alloc]init];
        self.frameTF = tf;
        tf.delegate = self;
        tf.borderStyle = UITextBorderStyleLine;
        tf;
    });
    [containerView addSubview:cityTF];
    [cityTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userTF);
        make.width.and.height.mas_equalTo(userTF);
        make.top.mas_equalTo(nameTF.mas_bottom).mas_offset(margin);
    }];
#pragma mark -- 区县
    UILabel * quL = ({
        UILabel * label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.backgroundColor = [UIColor cyanColor];
        label.text = @"区县:";
        label;
    });
    [containerView addSubview:quL];
    [quL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userL);
        make.top.mas_equalTo(cityL.mas_bottom).mas_offset(margin);
        make.width.and.height.mas_equalTo(userL);
    }];
    UITextField * quTF = ({
        UITextField * tf = [[UITextField alloc]init];
        self.frameTF = tf;
        tf.delegate = self;
        tf.borderStyle = UITextBorderStyleLine;
        tf;
    });
    [containerView addSubview:quTF];
    [quTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userTF);
        make.width.and.height.mas_equalTo(userTF);
        make.top.mas_equalTo(cityTF.mas_bottom).mas_offset(margin);
    }];
 /**
  .
  .
  .
  
  */
#pragma mark -- 密码
    UILabel * passWordL = ({
        UILabel * label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.backgroundColor = [UIColor cyanColor];
        label.text = @"密码:";
        label;
    });
    [containerView addSubview:passWordL];
    [passWordL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userL);
        make.top.mas_equalTo(quL.mas_bottom).mas_offset(margin);
        make.width.and.height.mas_equalTo(userL);
    }];
    UITextField * passWordTF = ({
        UITextField * tf = [[UITextField alloc]init];
        self.frameTF = tf;
        tf.delegate = self;
        tf.borderStyle = UITextBorderStyleLine;
        tf;
    });
    [containerView addSubview:passWordTF];
    [passWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userTF);
        make.width.and.height.mas_equalTo(userTF);
        make.top.mas_equalTo(quTF.mas_bottom).mas_offset(margin);
    }];
#pragma mark -- 确认密码
    UILabel * confirmL = ({
        UILabel * label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        label.backgroundColor = [UIColor cyanColor];
        label.text = @"确认密码:";
        label;
    });
    [containerView addSubview:confirmL];
    [confirmL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userL);
        make.top.mas_equalTo(passWordL.mas_bottom).mas_offset(margin);
        make.width.and.height.mas_equalTo(userL);
    }];
    UITextField * confirmTF = ({
        UITextField * tf = [[UITextField alloc]init];
        self.frameTF = tf;
        tf.delegate = self;
        tf.borderStyle = UITextBorderStyleLine;
        tf;
    });
    [containerView addSubview:confirmTF];
    [confirmTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userTF);
        make.width.and.height.mas_equalTo(userTF);
        make.top.mas_equalTo(passWordTF.mas_bottom).mas_offset(margin);
    }];
    
    [containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(confirmL.mas_bottom).mas_offset(margin);
        make.left.and.right.and.top.mas_offset(0);
     }];
    
}
#pragma mark -- textFiledDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //self.frameTF = textField;
    NSLog(@"%@",NSStringFromCGRect(textField.frame));
    //转换坐标系
    CGRect rect = [textField convertRect:textField.bounds toView:nil];
    self.tfRect = rect;
    return YES;
}

/**
 * 键盘的frame发生改变时调用（显示、隐藏等）
 */
#if 1
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    // 执行动画
    [UIView animateWithDuration:duration animations:^{
        if (keyboardF.origin.y >= [UIScreen mainScreen].bounds.size.height) {
            //键盘消失
           [self.bgScrollView setContentOffset:CGPointZero animated:YES];

        } else {
            //键盘出现
            //键盘遮挡了textfiled
            if ((keyboardF.origin.y <= self.tfRect.origin.y)) {
                
                self.bgScrollView.contentOffset = CGPointMake(0, self.tfRect.origin.y + self.tfRect.size.height - ([UIScreen mainScreen].bounds.size.height - keyboardF.size.height));
            
            }

        }

        
    }];
//#endif
}
#endif
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}






































//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//
//    _bgScrollView.contentSize = CGSizeMake(containerView.bounds.size.width, containerView.bounds.size.height);
//
////    [containerView mas_updateConstraints:^(MASConstraintMaker *make) {
////
////    }];
//};



























//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{//字典数组
//   NSArray * shiArr = [ShiModel mj_objectArrayWithKeyValuesArray:_array];
//    for (ShiModel * model in shiArr) {
//        NSLog(@"市名:%@",model.shiName);
//        for (QuXianModel * quModel in model.shiArr) {
//            NSLog(@"区名:%@",quModel.name);
//            for (SchoolModel * schoolModel in quModel.arr) {
//                NSLog(@"学校名:%@",schoolModel.schoolName);
//            }
//        }
//        NSLog(@"****************************");
//    }
//}

//    NSString * path = [[NSBundle mainBundle]pathForResource:@"LDD" ofType:@"plist"];
//    NSArray * shiArr = [ShiModel mj_objectArrayWithFile:path];
@end
