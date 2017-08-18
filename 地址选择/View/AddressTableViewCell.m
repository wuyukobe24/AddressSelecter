//
//  AddressTableViewCell.m
//  地址选择
//
//  Created by WangXueqi on 17/8/16.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "AddressTableViewCell.h"
#import "AddressItem.h"
#import "UIView+Extension.h"

@interface AddressTableViewCell ()

@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UIImageView *selectFlag;

@end
@implementation AddressTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        if (!_addressLabel) {
            _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 100, 20)];
            _addressLabel.font = [UIFont systemFontOfSize:14];
            _addressLabel.textColor = [UIColor blackColor];
            [self addSubview:_addressLabel];
        }
        
        if (!_selectFlag) {
            _selectFlag = [[UIImageView alloc]init];
            [_selectFlag setImage:[UIImage imageNamed:@"btn_check"]];
            [self addSubview:_selectFlag];
        }
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItem:(AddressItem *)item{
    _item = item;
    CGSize nameSize = [self getLabelTextSizeWidthAndHightWithTitle:item.name andFont:14];
    _addressLabel.text = item.name;
    _addressLabel.textColor = item.isSelected ? [UIColor orangeColor] : [UIColor blackColor];
    _addressLabel.frame = CGRectMake(20, 5, nameSize.width, 20);
    _selectFlag.hidden = !item.isSelected;
    _selectFlag.frame = CGRectMake(_addressLabel.right+5, 10, 14, 10);
}

//获取文本长和宽
-(CGSize)getLabelTextSizeWidthAndHightWithTitle:(NSString *)title andFont:(CGFloat)font{
    
    CGSize labelSize = [title sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]}];
    
    return labelSize;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
