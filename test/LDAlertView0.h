//
//  LDCollectionPictureCell.h
//  AI-English_Learning
//
//  Created by 李洞洞 on 6/2/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^activeSuccess)();
@interface LDAlertView0 : UIView
@property(nonatomic,copy)activeSuccess active;
- (void)show;
- (void)dismiss;
@end
