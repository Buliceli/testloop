//
//  QuXianModel.h
//  test
//
//  Created by 李洞洞 on 19/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SchoolModel.h"
@interface QuXianModel : NSObject
@property(nonatomic,copy)NSString* name;
//@property(nonatomic,strong)SchoolModel * school;
@property(nonatomic,strong)NSArray<SchoolModel*> * arr;
@end
