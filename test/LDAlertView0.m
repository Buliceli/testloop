//
//  LDCollectionPictureCell.h
//  AI-English_Learning
//
//  Created by 李洞洞 on 6/2/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "LDAlertView0.h"
#import "UIView+XMGExtension.h"
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LDAlertView0 ()
@property (nonatomic, strong) UIView       * alertV;
@property (nonatomic, strong) UIButton     * closeBtn;
@property (nonatomic, strong) UILabel      * ldTextLabel;
@property (nonatomic, strong) UIImageView  * ldImageView;

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
    _alertV.transform = CGAffineTransformMakeScale(0.75, 0.75);
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
                         [self.ldImageView startAnimating];
                        // [self recozerVoice];
                         
    } completion:nil];
    
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        
        _alertV.transform = CGAffineTransformMakeScale(0.75, 0.75);
        _alertV.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        //[_iFlySpeechRecognizer cancel];
        self.hidden = YES;
        
    }];
}

#pragma mark - UI
- (void)_initSubviews {
    [self addSubview:self.alertV];
    [self.alertV addSubview:self.closeBtn];
    [self.alertV addSubview:self.ldTextLabel];
    [self.alertV addSubview:self.ldImageView];
}

- (UIView *)alertV {
    
    if (!_alertV) {
        _alertV = [[UIView alloc] initWithFrame:CGRectMake(50, (SCREEN_HEIGHT-200)/2.0 + 200, SCREEN_WIDTH-100, 200)];
        _alertV.layer.cornerRadius = 5.0;
        _alertV.layer.masksToBounds = YES;
        _alertV.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    }
    return _alertV;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setFrame:CGRectMake(25, 30, 70, 50)];
        [_closeBtn setTitle:@"Bigfish" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _closeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    }
    return _closeBtn;
}

- (UILabel *)ldTextLabel {
    if (!_ldTextLabel) {
        _ldTextLabel = [[UILabel alloc]init];
        CGFloat x = 20;
        CGFloat y = CGRectGetMaxY(self.closeBtn.frame) + 50;
        [_ldTextLabel setFrame:CGRectMake(x, y, 150, 50)];
        _ldTextLabel.text = @"请开始说话";
        
        _ldTextLabel.textColor = HWColor(184, 184, 184);
        
        [_ldTextLabel setFont:[UIFont boldSystemFontOfSize:18]];
    }
    return _ldTextLabel;
}
- (UIImageView *)ldImageView {
    if (!_ldImageView) {
        _ldImageView = [[UIImageView alloc]init];
        _ldImageView.xmg_x = self.alertV.xmg_width - 90;
        
        _ldImageView.xmg_y = 30;
        
        _ldImageView.image = [UIImage imageNamed:@"voice_full"];
        _ldImageView.animationImages = @[[UIImage imageNamed:@"voice_empty"],[UIImage imageNamed:@"voice_full"]];
        
        _ldImageView.animationDuration = 0.8;
        _ldImageView.xmg_size = CGSizeMake(70, 70);
        _ldImageView.contentMode = UIViewContentModeScaleAspectFit;
       
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
    [self dismiss];
    //UI消失时 停止讯飞的录音
    [[NSNotificationCenter defaultCenter]postNotificationName:@"lddAlertDismiss" object:nil];
}






@end
