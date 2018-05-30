//
//  LDCollectionPictureCell.h
//  AI-English_Learning
//
//  Created by 李洞洞 on 6/2/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "LDAlertView0.h"
#import "UIView+XMGExtension.h"
#import "ActiveNumView.h"
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface LDAlertView0 ()
@property (nonatomic, strong) UIView       * alertV;
@property (nonatomic, strong) UILabel     * closeBtn;
@property (nonatomic, strong) UIButton      * ldTextLabel;
@property (nonatomic, strong) ActiveNumView  * ldImageView;
@property(nonatomic,copy)NSString * activeStr;
@property(nonatomic,strong)UILabel * textAlert;
@end

@implementation LDAlertView0

- (instancetype)init {
    if (self = [super init]) {
        self.frame = SCREEN_BOUNDS;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        [self _initSubviews];
}
    return self;
}
- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    _alertV.alpha = 1.0;
    _alertV.backgroundColor = HWColor(40, 40, 40);
    [UIView animateWithDuration:0.7
                          delay:0.0
         usingSpringWithDamping:0.5
          initialSpringVelocity:1.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _alertV.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         _alertV.alpha = 1.0;
                         _alertV.backgroundColor = HWColor(40, 40, 40);
                         _alertV.center = keyWindow.center;
                         
                         
    } completion:nil];
    
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        
        _alertV.transform = CGAffineTransformMakeScale(0.75, 0.75);
        _alertV.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        self.hidden = YES;
        
    }];
}

#pragma mark - UI
- (void)_initSubviews {
    [self addSubview:self.alertV];
    [self.alertV addSubview:self.closeBtn];
    [self.alertV addSubview:self.ldTextLabel];
    self.ldImageView.backgroundColor = [UIColor clearColor];
    [self.alertV addSubview:self.ldImageView];
    self.textAlert.hidden = YES;
    [self.alertV addSubview:self.textAlert];
}

- (UIView *)alertV {
    
    if (!_alertV) {
        _alertV = [[UIView alloc] initWithFrame:CGRectMake(50, (SCREEN_HEIGHT-200)/2.0 + 200, SCREEN_WIDTH-50, 200)];
        _alertV.layer.cornerRadius = 5.0;
        _alertV.layer.masksToBounds = YES;
        _alertV.backgroundColor = [UIColor lightGrayColor];
        _alertV.backgroundColor = [UIColor orangeColor];
    }
    return _alertV;
}

- (UILabel *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [[UILabel alloc]init];
        [_closeBtn setFrame:CGRectMake(25, 10, SCREEN_WIDTH-100-25, 50)];
        _closeBtn.text = @"请输入激活码";
        _closeBtn.font = [UIFont boldSystemFontOfSize:20];
        _closeBtn.textColor = HWColor(184, 184, 184);
    }
    return _closeBtn;
}

- (UIButton *)ldTextLabel {
    if (!_ldTextLabel) {
        _ldTextLabel = [[UIButton alloc]init];
        _ldTextLabel.showsTouchWhenHighlighted = YES;
        CGFloat x = CGRectGetMaxX(self.alertV.frame) - 170;
        CGFloat y = CGRectGetMaxY(self.closeBtn.frame) + 70;
        [_ldTextLabel setFrame:CGRectMake(x, y, 150, 50)];
        [_ldTextLabel setTitle:@"激活" forState:UIControlStateNormal];
        _ldTextLabel.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_ldTextLabel addTarget:self action:@selector(activeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ldTextLabel;
}
- (UILabel *)textAlert
{
    if (!_textAlert) {
        _textAlert = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMinY(self.ldTextLabel.frame), CGRectGetWidth(self.alertV.frame) - CGRectGetWidth(self.ldTextLabel.frame), 25)];
        CGPoint point = _textAlert.center;
        point.y = self.ldTextLabel.center.y;
        _textAlert.center = point;
        _textAlert.text = @"输入错误请重新输入";
        _textAlert.textColor = [UIColor redColor];
    }
    return _textAlert;
}
/**
 点击了激活按钮
 */
- (void)activeBtnClick
{
    
    NSLog(@"...%@...",self.activeStr);
    if ([self.activeStr isEqualToString:@"1111"]) {
        [self dismiss];
        if (self.active) {
            self.active();
        }
    }else{
        self.activeStr = @"";
        self.ldImageView.codeTextField.text = @"";
        for (UIView * view in self.ldImageView.subviews) {
            if ([view isKindOfClass:[UILabel class]]) {
                UILabel * labl = (UILabel *)view;
                labl.text = nil;
            }
        }
        self.textAlert.hidden = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.textAlert.hidden = YES;
        });
    }
}
- (ActiveNumView *)ldImageView {
    if (!_ldImageView) {
        CGFloat distance = ((SCREEN_WIDTH-50) - 40 * 4) / (4+1);
        _ldImageView = [[ActiveNumView alloc]initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH-50, 40) andLabelCount:4 andLabelDistance:distance isCircle:NO];
        __weak typeof(self) weakSelf = self;
        _ldImageView.codeBlock = ^(NSString *codeString) {
            
            weakSelf.activeStr = codeString;
        };
   }
    return _ldImageView;
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //当事件是传递给此View内部的子View时，让子View自己捕获事件，如果是传递给此View自己时，放弃事件捕获
    UIView* __tmpView = [super hitTest:point withEvent:event];
    
    if (__tmpView == self.alertV) {
        return nil;
    }
    return __tmpView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   // [self dismiss];
    [self endEditing:YES];
    
}






@end
