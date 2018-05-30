//
//  ActiveNumView.h
//  PhoneticLearningProject
//
//  Created by 李洞洞 on 20/12/17.
//  Copyright © 2017年 yimi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^NNCodeDidChangeBlock)(NSString *codeString);
@interface ActiveNumView : UIView
- (instancetype)initWithFrame:(CGRect)frame andLabelCount:(NSInteger)labelCount andLabelDistance:(CGFloat)labelDistance isCircle:(BOOL)isCirce;

/// 回调的 block , 获取输入的数字
@property (nonatomic, copy) NNCodeDidChangeBlock codeBlock;

/// 默认颜色 不设置的话是黑色
@property (nonatomic, strong) UIColor *defaultColor;

/// 改变后的颜色 不设置的话是红色
@property (nonatomic, strong) UIColor *changedColor;
@end
