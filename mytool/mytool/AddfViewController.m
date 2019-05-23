//
//  AddfViewController.m
//  mytool
//
//  Created by  cheyong on 17/6/22.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "AddfViewController.h"
#import "NSString+Frame.h"

@interface AddfViewController ()<UITextViewDelegate>
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *beizhu;
@property (nonatomic,strong)UILabel *lb;

@end

@implementation AddfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mydaohang];
    //利用RAC监听输入框的变化
    [self.nameText.rac_textSignal subscribeNext:^(id  _Nullable x) {
        _name = x;
        NSLog(@"%@",_name);
    }];
    
//    [self.beizhuText.rac_textSignal subscribeNext:^(id  _Nullable x) {
//        _beizhu = x;
//        _beizhuHeight.constant = [_beizhu heightWithFont:[UIFont systemFontOfSize:27] withinWidth:k_w-40];
//        
//    }];
    [self.beizhuTextView.rac_textSignal subscribeNext:^(id  _Nullable x) {
        _beizhu = x;
        _textViewHeight.constant = [_beizhu heightWithFont:[UIFont systemFontOfSize:15] withinWidth:(k_w-40)];

    }];
    
    
    
}

/**
 给textview添加占位符
 */
- (void)TextviewPlaceholder
{
    UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, 300, 100)];
    tv.delegate = self;
    tv.backgroundColor = [UIColor redColor];
    self.lb = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 300, 20)];
    self.lb.text = @"我是占位符";
    self.lb.enabled = NO;
    self.lb.backgroundColor = [UIColor clearColor];
    [tv addSubview:self.lb];
    [self.view addSubview:tv];
    [tv.rac_textSignal subscribeNext:^(id  _Nullable x) {
        NSString *zhusi = x;
        if (zhusi.length == 0) {
            self.lb.alpha = 1;
        }else
        {
            self.lb.alpha = 0;
        }
        
    }];

}
//点击屏幕收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
//    if ([text isEqualToString:@"\n"]) {
//        [textView resignFirstResponder];//按回车取消第一相应者
//    }
//    return YES;
//}


//- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
//{
//    self.lb.alpha = 0;//开始编辑时
//    return YES;
//}
//- (BOOL)textViewShouldEndEditing:(UITextView *)textView
//{//将要停止编辑(不是第一响应者时)
//    if (textView.text.length == 0) {
//        self.lb.alpha = 1;
//    }
//    return YES;
//}

/**
 自定义导航
 */
- (void)mydaohang
{
    MyNaVC *mynavc = [[MyNaVC alloc]init];
    [mynavc initwithcolor:[UIColor redColor] title:@"添加物品"] ;
    [mynavc.btn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:mynavc];
}
//返回
- (void)fanhui
{
    if ([self.delegate respondsToSelector:@selector(passName:)]) {
        [self.delegate passName:_name];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
