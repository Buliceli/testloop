//
//  Manager.h
//  test
//
//  Created by 李洞洞 on 29/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ManagerProtocol <NSObject>
- (void)buyMood;
@end
@interface Manager : NSObject<ManagerProtocol>

@end
