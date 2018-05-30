//
//  NSObject+Prepory.h
//  test
//
//  Created by 李洞洞 on 28/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
/*
 主动方制定协议
 被动方遵守协议
 目前这个NSObject+Prepory的分类既制定协议 又遵守协议 很别致啊
 这么搞的话 应该只适用与分类 那个类使用此分类 相当于那个类遵守了协议
 使用此分类的类就不需要再遵守了
 */

#import <Foundation/Foundation.h>
@protocol LDModel <NSObject>
@optional

/**
 模型字段是数组

 @return {模型字段 : 数组中存储的自定义模型的类名}
 */
+ (NSDictionary *)objectClassInArray;

/**
 模型中特殊字段(id...)的替换

 @return {模型中的字段:字典中的特殊字段}
 */
+ (NSDictionary *)propertykeyReplacedWithValue;
@end

@interface NSObject (Prepory)<LDModel>
+ (id)modelWithDict:(NSDictionary*)dict;
@end
