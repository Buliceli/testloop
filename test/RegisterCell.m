//
//  RegisterCell.m
//  test
//
//  Created by 李洞洞 on 20/12/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "RegisterCell.h"
@interface RegisterCell ()
@property(nonatomic,strong)UILabel * ldTitleLabel;
@property(nonatomic,strong)UITextField * ldTF;
@end
@implementation RegisterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _ldTitleLabel = [[UILabel alloc]init];
        _ldTF = [[UITextField alloc]init];
        //_ldTF.backgroundColor = [UIColor cyanColor];
        //_ldTF.borderStyle = UITextBorderStyleLine;
        [self.contentView addSubview:_ldTF];
        [self.contentView addSubview:_ldTitleLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _ldTitleLabel.frame = CGRectMake(0, 0, self.frame.size.width * 0.3, self.frame.size.height);
    _ldTF.frame = CGRectMake(self.frame.size.width * 0.3, 0, self.frame.size.width * 0.7, self.frame.size.height);
}
@end
