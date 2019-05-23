//
//  XWAlertView.m
//  mytool
//
//  Created by  cheyong on 17/5/15.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "XWAlertView.h"

@implementation XWAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建遮罩层
        _blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, k_w, k_h)];
        _blackView.backgroundColor = [UIColor blackColor];
        _blackView.alpha = 0.5;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(blackClick)];
        [_blackView addGestureRecognizer:tap];
        [self addSubview:_blackView];
        //创建alert
        self.alertview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 270, 250)];
        self.alertview.center = self.center;
        self.alertview.layer.cornerRadius = 17;
        self.alertview.clipsToBounds = YES;
        self.alertview.backgroundColor = [UIColor whiteColor];
        [self addSubview:_alertview];
        [self exChangeOut:self.alertview dur:0.6];

    }
    return self;
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    switch (_type) {
        case 66:
            //带输入框的
            [self creatviewchang];
            
            break;
        case 67:
            [self alertquit];
            
            break;
        case 68:
            //模仿支付宝
            [self zhifubao];
            
            break;


        default:
            break;
    }
    
    [self createBtnTitle:_btnTitleArr];
}
//推出的 67
- (void)alertquit
{
    self.alertview.backgroundColor = [UIColor blackColor];
    UIImageView *back = [[UIImageView alloc]initWithFrame:self.alertview.bounds];
    back.image = [UIImage imageNamed:@"tanbeijing"];
    [self.alertview addSubview:back];

//    _tipLable = [[UILabel alloc]initWithFrame:CGRectMake(0,0,270,43)];
//    _tipLable.textAlignment = NSTextAlignmentCenter;
//    [_tipLable setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]];
//    _tipLable.text = _title;
//    [_tipLable setFont:[UIFont systemFontOfSize:18]];
//    [_tipLable setTextColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]];
//    [self.alertview addSubview:_tipLable];
    UILabel *showL = [[UILabel alloc]initWithFrame:CGRectMake(20, _tipLable.frame.origin.y+_tipLable.frame.size.height, self.alertview.frame.size.width-40, self.alertview.frame.size.height-43-48)];
    [showL setTextColor:[UIColor colorWithRed:149/255.0 green:149/255.0 blue:149/255.0 alpha:1.0]];
    
    showL.numberOfLines = 0;
    [showL setFont:[UIFont systemFontOfSize:18]];
    [showL setText:_contentStr];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:showL.text];;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:9];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, showL.text.length)];
    
    showL.attributedText = attributedString;
    showL.textAlignment = NSTextAlignmentCenter;
    
    
    [self.alertview addSubview:showL];

    
}


//带输入框的 66
- (void)creatviewchang
{
    self.alertview.backgroundColor = [UIColor blackColor];
    _tipLable = [[UILabel alloc]initWithFrame:CGRectMake(0,0,270,43)];
    _tipLable.textAlignment = NSTextAlignmentCenter;
    [_tipLable setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]];
    [_tipLable setBackgroundColor:[UIColor clearColor]];
    UIImageView *back = [[UIImageView alloc]initWithFrame:self.alertview.bounds];
    back.image = [UIImage imageNamed:@"tanbeijing"];
    [self.alertview addSubview:back];

    _tipLable.text = _title;
    [_tipLable setFont:[UIFont systemFontOfSize:18]];
    [_tipLable setTextColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]];
    [self.alertview addSubview:_tipLable];
    _textF =[[UITextField alloc]initWithFrame:CGRectMake(15, _tipLable.frame.origin.y+20+ _tipLable.frame.size.height-10, self.alertview.frame.size.width-30, 40)];
    _textF.placeholder = @"请输入密码";
    _textF.tag = 11;
    //_textF.secureTextEntry = YES;
    _textF.backgroundColor = UIColorFromRGB(0xb4aad9);
    _textF.font = [UIFont systemFontOfSize:12];
    _textF.borderStyle = UITextBorderStyleRoundedRect;
    _textF.returnKeyType = UIReturnKeyDone;
    _textF.delegate = self;
    [_textF becomeFirstResponder];
     [self.alertview addSubview:_textF];
    

}

/**
 68支付宝
 */
- (void)zhifubao
{
    self.alertview.backgroundColor = [UIColor blackColor];
    self.alertview.frame = CGRectMake(0, 0, 230, 200);
     self.alertview.center = self.center;
    _tipLable = [[UILabel alloc]initWithFrame:CGRectMake(0,0,270,43)];
    _tipLable.textAlignment = NSTextAlignmentCenter;
    [_tipLable setBackgroundColor:[UIColor clearColor]];
    UIImageView *back = [[UIImageView alloc]initWithFrame:self.alertview.bounds];
    back.image = [UIImage imageNamed:@"tanbeijing"];
    [self.alertview addSubview:back];
    _tipLable.text = _title;
    [_tipLable setFont:[UIFont systemFontOfSize:18]];
    [_tipLable setTextColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]];
    [self.alertview addSubview:_tipLable];
    _pasView = [[SYPasswordView alloc]initWithFrame:CGRectMake(10, _tipLable.frame.origin.y+20+ _tipLable.frame.size.height-10, self.alertview.frame.size.width-20, 45)];
    _pasView.delegate = self;
    [self.alertview addSubview:_pasView];
    
}
- (void)password:(NSString *)password
{
    NSLog(@"开始%@",password);
//    if ([self.delegate respondsToSelector:@selector(didClickButtonAtIndex:password:)]) {
//        [self.delegate didClickButtonAtIndex:_mybtn.tag password:password];
//    }
    
    _password = password;
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    _password = textField.text;
    NSLog(@"%@",_password);
    return YES;
}

//创建按钮
- (void)createBtnTitle:(NSArray *)titleArr
{
    CGFloat m = self.alertview.frame.size.width;
    CGFloat h = self.alertview.frame.size.height;
    
    for (int i=0; i<_numBtn; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _mybtn = btn;
        if (_numBtn==1) {
            btn.frame = CGRectMake(20, (h-48), (m-40), 33);
        }else
        {
            btn.frame = CGRectMake(20+i*(20+(m-60)/2), h-56, (m-60)/2, 33);

        }
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        btn.tag = 100+i;
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds = YES;
        [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:18]];
        if ([titleArr[i] isEqualToString:@"提交"]||[titleArr[i] isEqualToString:@"退出页面"]) {
            [btn setBackgroundColor:UIColorFromRGB(0xf10960)];
        }else{
            [btn setBackgroundColor:UIColorFromRGB(0x666666)];
        }

        [self.alertview addSubview:btn];
        

    }
}
-(void)clickButton:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(didClickButtonAtIndex:password:)]) {
        if (_password == nil) {
            [self textFieldShouldEndEditing:_textF];
            [_textF resignFirstResponder];
        }
        [self.delegate didClickButtonAtIndex:button.tag password:_password];

    }
    
    [self cancelView];
}
//传值方法
-(void)initWithTitle:(NSString *) title contentStr:(NSString *)content type:(NSInteger)type btnNum:(NSInteger)btnNum btntitleArr:(NSArray *)btnTitleArr

{
    _title = title;
    _type = type;
    _numBtn = btnNum;
    _btnTitleArr = btnTitleArr;
    _contentStr = content;
}

- (void)blackClick
{
    [self cancelView];
}
- (void)cancelView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.alertview = nil;
    }];
}
//弹出动画
-(void)exChangeOut:(UIView *)changeOutView dur:(CFTimeInterval)dur{
    CAKeyframeAnimation * animation;
    
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = dur;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    [changeOutView.layer addAnimation:animation forKey:nil];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
