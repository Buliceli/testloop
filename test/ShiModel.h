//
//  AreaModel.h
//  test
//
//  Created by 李洞洞 on 19/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SchoolModel.h"
#import "QuXianModel.h"
@interface ShiModel : NSObject
@property(nonatomic,strong)NSString * shiName;
@property(nonatomic,strong)NSArray<QuXianModel*> * shiArr;
@end
