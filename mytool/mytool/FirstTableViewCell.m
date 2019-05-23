//
//  FirstTableViewCell.m
//  mytool
//
//  Created by  cheyong on 17/6/8.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.image.layer.masksToBounds = YES;
    self.image.layer.cornerRadius = 25;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
