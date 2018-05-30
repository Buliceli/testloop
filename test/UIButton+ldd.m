//
//  UIButton+ldd.m
//  test
//
//  Created by 李洞洞 on 27/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "UIButton+ldd.h"
#import <objc/message.h>
@implementation UIButton (ldd)
const char * const LD_Key = "Key";
- (void)setLd_Title:(NSString *)ld_Title
{
    objc_setAssociatedObject(self, LD_Key, ld_Title, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString*)ld_Title
{

    return objc_getAssociatedObject(self, LD_Key);
}
@end
