//
//  HXWNewsNormalCell.m
//  频道切换
//
//  Created by huaxianwei on 16/5/21.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "HXWNewsNormalCell.h"

@implementation HXWNewsNormalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setTest:(BOOL)test
{
//    self.backgroundColor = [UIColor clearColor];
    _newsThumbImageView.dk_backgroundColorPicker = DKColorPickerWithKey(新闻列表Cell背景颜色);
    
    _newsDividerImageView.dk_backgroundColorPicker = DKColorPickerWithKey(新闻列表Cell分割线颜色);
    
}

@end
