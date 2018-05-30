//
//  YLDragSortTool.h
//  test
//
//  Created by 李洞洞 on 6/11/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLDragSortTool : NSObject
@property (nonatomic,assign) BOOL isEditing;
@property (nonatomic,strong) NSMutableArray * subscribeArray;
+ (instancetype)shareInstance;
@end
