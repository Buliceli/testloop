//
//  Person.m
//  test
//
//  Created by 李洞洞 on 27/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        //归档
        [aCoder encodeObject:value forKey:key];
    }
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i ++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
           //解档
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
    }
    return self;
}

@end



















/*
 void ldd(id ldself,SEL ldsel,id some){
 NSLog(@"这是一个动态添加的方法");
 NSLog(@"%@ -- %@",[ldself class],NSStringFromSelector(ldsel));
 };
 + (BOOL)resolveClassMethod:(SEL)sel
 {
 return [super resolveClassMethod:sel];
 }
 
 + (BOOL)resolveInstanceMethod:(SEL)sel
 {
 if (sel == NSSelectorFromString(@"eat:")) {
 class_addMethod([self class], @selector(eat:), (IMP)ldd, "V@:@");
 }
 return [super resolveClassMethod:sel];
 }
 */
