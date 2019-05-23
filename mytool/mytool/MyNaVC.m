//
//  MyNaVC.m
//  mytool
//
//  Created by  cheyong on 17/6/8.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "MyNaVC.h"

@implementation MyNaVC
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, 0, k_w, 64);
        _titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 24)];
        _titlelabel.center = self.center;
        _titlelabel.textColor = [UIColor greenColor];
        _titlelabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titlelabel];
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(10, 20 ,20, 30);
        [_btn setBackgroundImage:[UIImage imageNamed:@"22"] forState:UIControlStateNormal];
        [self addSubview:_btn];
    }
     return self;
}
- (void)initwithcolor:(UIColor *)mycolor title:(NSString *)title
{
    self.backgroundColor = mycolor;
    _titlelabel.text = title;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
