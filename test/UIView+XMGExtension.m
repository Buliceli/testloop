//
//  UIView+XMGExtension.m
//
//  Created by on 15/1/6.
//  Copyright © 2015年. All rights reserved.
//

#import "UIView+XMGExtension.h"

@implementation UIView (XMGExtension)

- (CGSize)xmg_size
{
    return self.frame.size;
}

- (void)setXmg_size:(CGSize)xmg_size
{
    CGRect frame = self.frame;
    frame.size = xmg_size;
    self.frame = frame;
}

- (CGFloat)xmg_width
{
    return self.frame.size.width;
}

- (CGFloat)xmg_height
{
    return self.frame.size.height;
}

- (void)setXmg_width:(CGFloat)xmg_width
{
    CGRect frame = self.frame;
    frame.size.width = xmg_width;
    self.frame = frame;
}

- (void)setXmg_height:(CGFloat)xmg_height
{
    CGRect frame = self.frame;
    frame.size.height = xmg_height;
    self.frame = frame;
}

- (CGFloat)xmg_x
{
    return self.frame.origin.x;
}

- (void)setXmg_x:(CGFloat)xmg_x
{
    CGRect frame = self.frame;
    frame.origin.x = xmg_x;
    self.frame = frame;
}

- (CGFloat)xmg_y
{
    return self.frame.origin.y;
}

- (void)setXmg_y:(CGFloat)xmg_y
{
    CGRect frame = self.frame;
    frame.origin.y = xmg_y;
    self.frame = frame;
}

- (CGFloat)xmg_centerX
{
    return self.center.x;
}

- (void)setXmg_centerX:(CGFloat)xmg_centerX
{
    CGPoint center = self.center;
    center.x = xmg_centerX;
    self.center = center;
}

- (CGFloat)xmg_centerY
{
    return self.center.y;
}

- (void)setXmg_centerY:(CGFloat)xmg_centerY
{
    CGPoint center = self.center;
    center.y = xmg_centerY;
    self.center = center;
}

- (CGFloat)xmg_right
{
//    return self.xmg_x + self.xmg_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)xmg_bottom
{
//    return self.xmg_y + self.xmg_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setXmg_right:(CGFloat)xmg_right
{
    self.xmg_x = xmg_right - self.xmg_width;
}

- (void)setXmg_bottom:(CGFloat)xmg_bottom
{
    self.xmg_y = xmg_bottom - self.xmg_height;
}

+ (instancetype)viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (BOOL)intersectWithView:(UIView *)view
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    
    CGRect viewRect = [view convertRect:view.bounds toView:window];
         //判断 selfRect是否在viewRect内。。
    return CGRectIntersectsRect(selfRect, viewRect);
}
@end