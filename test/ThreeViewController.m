//
//  ThreeViewController.m
//  test
//
//  Created by 李洞洞 on 6/11/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "ThreeViewController.h"
#import "Masonry.h"
#import "YLDefine.h"
#import "LDDargCell.h"
#import "YLDragSortTool.h"
static NSString * const LDDargCellID = @"LDDargCell";
#define kSpaceBetweenSubscribe  4 * SCREEN_WIDTH_RATIO
#define kVerticalSpaceBetweenSubscribe  2 * SCREEN_WIDTH_RATIO
#define kSubscribeHeight  35 * SCREEN_WIDTH_RATIO
#define kContentLeftAndRightSpace  20 * SCREEN_WIDTH_RATIO
#define kTopViewHeight  80 * SCREEN_WIDTH_RATIO
@interface ThreeViewController ()<UICollectionViewDataSource,SKDragSortDelegate>
@property (nonatomic,strong) UICollectionView * dragSortView;
@property (nonatomic,strong) UIButton * sortDeleteBtn;
@property (nonatomic,strong) NSIndexPath * indexPath;
@property (nonatomic,strong) NSIndexPath * nextIndexPath;
@property (nonatomic,strong) UIView * snapshotView; //截屏得到的view
@property (nonatomic,weak) LDDargCell * originalCell;
@end
@implementation ThreeViewController

- (UICollectionView *)dragSortView {
    
    if (!_dragSortView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat width = (SCREEN_WIDTH - 3 * kSpaceBetweenSubscribe - 2 * kContentLeftAndRightSpace )/4 ;
        layout.itemSize = CGSizeMake(width, kSubscribeHeight + 10 * SCREEN_WIDTH_RATIO);
        layout.minimumLineSpacing = kSpaceBetweenSubscribe;
        layout.minimumInteritemSpacing = kVerticalSpaceBetweenSubscribe;
        layout.sectionInset = UIEdgeInsetsMake(kContentLeftAndRightSpace, kContentLeftAndRightSpace, kContentLeftAndRightSpace, kContentLeftAndRightSpace);
        _dragSortView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,kTopViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT - kTopViewHeight) collectionViewLayout:layout];
        //注册cell
        [_dragSortView registerClass:[LDDargCell class] forCellWithReuseIdentifier:LDDargCellID];
        _dragSortView.dataSource = self;
        _dragSortView.backgroundColor = [UIColor whiteColor];
    }
    return _dragSortView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.dragSortView];
    
}
#pragma mark -- CollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [YLDragSortTool shareInstance].subscribeArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LDDargCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:LDDargCellID forIndexPath:indexPath];
    cell.delegate = self;
    cell.subscribe = [YLDragSortTool shareInstance].subscribeArray[indexPath.row];
    return cell;
}
#pragma mark -- SKDragSortDelegate
//长按手势
- (void)YLDargSortCellGestureAction:(UIGestureRecognizer *)gestureRecognizer
{
    //记录上一次手势的位置
    static CGPoint startPoint;
    //触发长按手势的cell
    LDDargCell * cell = (LDDargCell*)gestureRecognizer.view;
    //长按手势刚刚开始
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
            [YLDragSortTool shareInstance].isEditing = YES;
            [_sortDeleteBtn setTitle:@"完成" forState:UIControlStateNormal];
            self.dragSortView.scrollEnabled = NO;
        }
        if (![YLDragSortTool shareInstance].isEditing) {
            return;
        }
        NSArray *cells = [self.dragSortView visibleCells];
        for (LDDargCell *cell in cells) {
            [cell showDeleteBtn];
        }
        
        
        //获取cell的截图
        _snapshotView  = [cell snapshotViewAfterScreenUpdates:YES];
        _snapshotView.center = cell.center;
        [_dragSortView addSubview:_snapshotView];
        _indexPath = [_dragSortView indexPathForCell:cell];
        _originalCell = cell;
        _originalCell.hidden = YES;
        startPoint = [gestureRecognizer locationInView:_dragSortView];
              //移动
    }else if (gestureRecognizer.state == UIGestureRecognizerStateChanged){
        CGFloat tranX = [gestureRecognizer locationOfTouch:0 inView:_dragSortView].x - startPoint.x;
        CGFloat tranY = [gestureRecognizer locationOfTouch:0 inView:_dragSortView].y - startPoint.y;
        //设置截图视图位置
        _snapshotView.center = CGPointApplyAffineTransform(_snapshotView.center, CGAffineTransformMakeTranslation(tranX, tranY));//把变化应用到一个点上
        startPoint = [gestureRecognizer locationOfTouch:0 inView:_dragSortView];
        //计算中心距
        CGFloat space = sqrtf(pow(_snapshotView.center.x - cell.center.x, 2) + powf(_snapshotView.center.y - cell.center.y, 2));
        //如果相交一半且两个视图Y的绝对值小于高度的一半就移动
        

        
    }
    
    
}






























/**
 * 给ScrollView及其子控件 加约束 xib和代码 都需要先搞个ContainerView上去
 */
- (void)scrollView
{
    UIScrollView * sc = [[UIScrollView alloc]init];
    sc.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:sc];
    
    [sc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.top.mas_offset(0);
        make.right.mas_offset(-20);
        make.height.mas_equalTo(150);
    }];
#if 1  //....错误的方式
    UITextField * tf1 = [[UITextField alloc]init];
    tf1.borderStyle = UITextBorderStyleRoundedRect;
    [sc addSubview:tf1];
    [tf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.right.mas_equalTo(sc.mas_right).mas_offset(-20);
        make.top.mas_offset(20);
        make.height.mas_equalTo(50);
        
    }];
#endif
#if 0 //.....正确的方式
    UIView * containerView = [[UIView alloc]init];
    containerView.backgroundColor = [UIColor purpleColor];
    [sc addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
        //make.height.mas_equalTo(500);
        make.centerX.mas_offset(0);
    }];
    
    UITextField * tf1 = [[UITextField alloc]init];
    tf1.borderStyle = UITextBorderStyleRoundedRect;
    [containerView addSubview:tf1];
    [tf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.right.mas_equalTo(sc.mas_right).mas_offset(-20);
        make.top.mas_offset(20);
        make.height.mas_equalTo(50);
        
    }];
    
    UITextField * tf2 = [[UITextField alloc]init];
    tf2.borderStyle = UITextBorderStyleRoundedRect;
    [containerView addSubview:tf2];
    [tf2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.top.mas_equalTo(tf1.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(50);
    }];
    
    UITextField * tf3 = [[UITextField alloc]init];
    tf3.borderStyle = UITextBorderStyleRoundedRect;
    [containerView addSubview:tf3];
    [tf3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.top.mas_equalTo(tf2.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(50);
    }];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(tf3.mas_bottom).mas_offset(20);
    }];
#endif
 
}
@end
