//
//  NSArray+ldd.m
//  test
//
//  Created by 李洞洞 on 27/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "NSArray+ldd.h"
#import <objc/message.h>
@implementation NSArray (ldd)
//const char * const LD_Key = "Key";
+ (void)load
{
    [super load];
    
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(ldd_objectAtIndex:));
    method_exchangeImplementations(fromMethod, toMethod);
    
    Method fromMutMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
    Method toMutMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(ldd_mutaObjectAtIndex:));
    method_exchangeImplementations(fromMutMethod, toMutMethod);
}
- (id)ldd_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self ldd_objectAtIndex:index];
    }else{
        return nil;
    }
}
- (id)ldd_mutaObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self ldd_mutaObjectAtIndex:index];
    }else{
        return nil;
    }
}
@end
