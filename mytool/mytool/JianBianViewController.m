//
//  JianBianViewController.m
//  mytool
//
//  Created by  cheyong on 17/7/27.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "JianBianViewController.h"
#import "SYPasswordView.h"
#import "XWAlertView.h"
@interface JianBianViewController ()<UIGestureRecognizerDelegate,XWAlertViewdelegate>
@property (nonatomic,strong) SYPasswordView *pasView;
@end

@implementation JianBianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //不设置背景颜色跳转界面的时候回卡
    self.view.backgroundColor = [UIColor greenColor];
    [self mydaohang];
    
    
    //加个渐变色视图
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, k_w, k_h)];
    
    [self.view addSubview:view];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id) [[UIColor redColor] CGColor]  ,[[UIColor whiteColor] CGColor], nil];
    [view.layer insertSublayer:gradient atIndex:0];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 180, k_w-200, 50);
    button.backgroundColor = [UIColor brownColor];
    [button addTarget:self action:@selector(clearPaw) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"支付宝输入框" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
}
- (void)clearPaw
{
   // [self.pasView clearUpPassword];
    
    XWAlertView *alert = [[XWAlertView alloc]initWithFrame:CGRectMake(0, -50, k_w, k_h)];
    [alert initWithTitle:@"支付宝" contentStr:@"确定要退出？？？" type:68 btnNum:2 btntitleArr:[NSArray arrayWithObjects:@"取消",@"提交", nil]];
    alert.delegate = self;
    [self.view addSubview:alert];

    
}
- (void)didClickButtonAtIndex:(NSUInteger)index password:(NSString *)password
{
    
    NSLog(@"出来啦%@",password);
}
/**
 自定义导航
 */
- (void)mydaohang
{
    MyNaVC *mynavc = [[MyNaVC alloc]init];
    [mynavc initwithcolor:[UIColor redColor] title:@"渐变色例子"] ;
    [mynavc.btn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mynavc];
}


//返回
- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}
//以下三种方法是禁用系统滑动返回功能
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return NO;
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
