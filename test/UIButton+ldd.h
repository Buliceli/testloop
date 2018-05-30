//
//  UIButton+ldd.h
//  test
//
//  Created by 李洞洞 on 27/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ldd)
/*
 不生成_ld_Title
 不生成 ld_Title的set get
 */
@property NSString * ld_Title;
@end
