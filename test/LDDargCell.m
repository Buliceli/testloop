//
//  LDDargCell.m
//  test
//
//  Created by 李洞洞 on 6/11/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "LDDargCell.h"
#import "YLDragSortTool.h"
#import "UIView+Frame.h"
#import "YLDefine.h"
#define kDeleteBtnWH 10 * SCREEN_WIDTH_RATIO
@interface LDDargCell ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)UIButton * deleteBtn;
@end
@implementation LDDargCell

/**
 重写collectionView的初始化方法

 @param frame frame description
 @return return value description
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}
- (void)setUp
{
    //给每个cell添加一个长按手势
    UILongPressGestureRecognizer * longPress =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(gestureAction:)];
    longPress.delegate = self;
    [self addGestureRecognizer:longPress];
    //给每个cell添加一个拖动手势
    UIPanGestureRecognizer * pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gestureAction:)];
    pan.delegate = self;
    [self addGestureRecognizer:pan];
    
    _label = [[UILabel alloc] init];
    [self.contentView addSubview:_label];
    _label.font = kFont(15);
    _label.textColor = RGBColorMake(110, 110, 110, 1);
    _label.layer.cornerRadius = 4 * SCREEN_WIDTH_RATIO;
    _label.layer.masksToBounds = NO;
    _label.layer.borderColor = RGBColorMake(110, 110, 110, 1).CGColor;
    _label.layer.borderWidth = kLineHeight;
    _label.textAlignment = NSTextAlignmentCenter;
    
    
    
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteBtn.backgroundColor = [UIColor cyanColor];
    _deleteBtn.width = kDeleteBtnWH;
    _deleteBtn.height = kDeleteBtnWH;
    
    [_deleteBtn addTarget:self action:@selector(cancelSubscribe) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_deleteBtn];
    
}
- (void)showDeleteBtn
{
    _deleteBtn.hidden = NO;
}
- (void)gestureAction:(UILongPressGestureRecognizer*)gesture
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(YLDargSortCellGestureAction:)]) {
        [self.delegate YLDargSortCellGestureAction:gesture];
    }
}

- (void)cancelSubscribe
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(YLDargSortCellCancelSubscribe:)]) {
        [self.delegate YLDargSortCellCancelSubscribe:self.subscribe];
    }
    
}
- (void)setSubscribe:(NSString *)subscribe
{
    _subscribe = subscribe;
    _deleteBtn.hidden = ![YLDragSortTool shareInstance].isEditing;
    _label.text = subscribe;
    _label.width = self.width - kDeleteBtnWH;
    _label.height = self.height - kDeleteBtnWH;
    _label.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

/**
 是否允许开始触发手势

 @param gestureRecognizer gestureRecognizer description
 @return return value description
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]&&![YLDragSortTool shareInstance].isEditing)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}






@end
