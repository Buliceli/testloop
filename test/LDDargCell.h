//
//  LDDargCell.h
//  test
//
//  Created by 李洞洞 on 6/11/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SKDragSortDelegate <NSObject>

- (void)YLDargSortCellGestureAction:(UIGestureRecognizer *)gestureRecognizer;

- (void)YLDargSortCellCancelSubscribe:(NSString *)subscribe;

@end

@interface LDDargCell : UICollectionViewCell
@property (nonatomic,strong) NSString * subscribe;
@property (nonatomic,weak) id<SKDragSortDelegate> delegate;

- (void)showDeleteBtn;
@end
