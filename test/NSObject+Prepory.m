//
//  NSObject+Prepory.m
//  test
//
//  Created by 李洞洞 on 28/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "NSObject+Prepory.h"
#import <objc/message.h>
@implementation NSObject (Prepory)
+ (id)modelWithDict:(NSDictionary *)dict
{
    id object = [[self alloc]init];
    unsigned int count = 0;
    Ivar * ivarList = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar  ivar = ivarList[i];
        char const *  name = ivar_getName(ivar);
        NSString * ocName = [NSString stringWithUTF8String:name];
        NSString * key = [ocName substringFromIndex:1];
        id value = nil;
        if ([self respondsToSelector:@selector(propertykeyReplacedWithValue)]) {
            key = [[self propertykeyReplacedWithValue]objectForKey:key];
            
            if (!key) {
                key = [ocName substringFromIndex:1];
            }

            value = dict[key];
            
        }
         key = [ocName substringFromIndex:1];
        
        const char * name1 = ivar_getTypeEncoding(ivar);
        NSString * newName = [[NSString alloc]initWithUTF8String:name1];
        
        
        if ([value isKindOfClass:[NSDictionary class]]&&![key hasPrefix:@"NS"]) {
            newName = [newName stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            newName = [newName stringByReplacingOccurrencesOfString:@"@" withString:@""];
            Class class = NSClassFromString(newName);
            id val = [class modelWithDict:value];
            [object setValue:val forKey:key];
            
            }else if ([value isKindOfClass:[NSArray class]]&&![key hasPrefix:@"NS"]){
                
                if ([self respondsToSelector:@selector(objectClassInArray)]) {
                    id propertyValueType = [[self objectClassInArray] objectForKey:key];
                    Class clas = NSClassFromString(propertyValueType);
                    NSArray * arr = (NSArray*)value;
                    id obj = nil;
                    NSMutableArray * muArr = [NSMutableArray array];
                    for (int i = 0; i < arr.count; i++) {
                       obj = [clas modelWithDict:arr[i]];//key里面放的是区县模型//这是一个模型
                        [muArr addObject:obj];
                    }
                    [object setValue:muArr forKey:key];

                }
                
                
            }else if (value) {

                
                [object setValue:value forKey:key];
                
            }
               
    }
    free(ivarList);
    return object;
}
@end
