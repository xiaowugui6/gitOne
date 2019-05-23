//
//  RACViewController.m
//  mytool
//
//  Created by  cheyong on 17/6/8.
//  Copyright © 2017年 xiaojia. All rights reserved.
//
#define kMargin 100
#import "RACViewController.h"

@interface RACViewController ()
@property (nonatomic,strong)UITextField *passwordTextFiled;
@property (nonatomic,strong) UITextField *accountTextFiled;
@property (nonatomic,strong) UIButton *OKBtn;

@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self mydaohang];
    
    [self danhangzhushi];
    [self duohangzhushi];
    [self fangfazhushi:@"方法注释"];
    [self Reactivecocoa];
    [self tianjiarac];

}

//良好的编码规范是程序员必备的素质，编码中的代码注释尤为重要，健全的代码注释可以提高代码的可读性和维护性，不仅为了标识此块代码的含义，很多时候包含了对业务逻辑的解释，项目中难免有逻辑复杂之处，不加注释的代码，数日之后自己看都觉得陌生，更不要说其他人看了，所以养成良好的编码习惯是非常有必要的
//注释的形式主要有：单行注释，多行注释，方法注释，方法集注释（配合代码块实现快速注释）
//这就是单行注释，最常见的使用场景
- (void)danhangzhushi
{
    NSLog(@"单行注释");
}

/**
 多行注释：快捷键（cmd + alt + / ）可以对属性和类以及方法进行注释，与单行注释不同的是该注释方式可以写多行，一般用在类的头文件多介绍当前类的含义
 */
- (void)duohangzhushi
{
    NSLog(@"多行注释");
}

/**
 方法注释：先写方法 在方法上面使用快捷键（cmd + alt + /）
 
 @param duo 传值
 */
- (void)fangfazhushi:(NSString*)duo
{
    NSLog(@"%@",duo);
}
#pragma mark 方法集注释 (<# #)
- (void)Reactivecocoa
{
    self.accountTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(kMargin, kMargin, k_w-kMargin*2, 50)];
    self.accountTextFiled.placeholder = @"账号";
    //修改占位符的颜色
    [self.accountTextFiled setValue:[UIColor purpleColor] forKeyPath:@"placeholderLabel.textColor"];
    self.accountTextFiled.layer.masksToBounds = YES;
    self.accountTextFiled.layer.cornerRadius = 5;
    self.accountTextFiled.textAlignment = NSTextAlignmentCenter;
    self.accountTextFiled.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.accountTextFiled];
    
    self.passwordTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(kMargin, kMargin*2, k_w-kMargin*2, 50)];
    //修改占位符的颜色
    
    self.passwordTextFiled.placeholder = @"密码";
     //修改占位符的颜色
    [self.passwordTextFiled setValue:[UIColor greenColor] forKeyPath:@"placeholderLabel.textColor"];
    self.passwordTextFiled.backgroundColor = [UIColor grayColor];
    self.passwordTextFiled.layer.cornerRadius = 5;
    self.passwordTextFiled.layer.masksToBounds = YES;
    self.passwordTextFiled.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.passwordTextFiled];
    
    self.OKBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.OKBtn.frame = CGRectMake((k_w-150)/2, kMargin*3, 150, 50);
    self.OKBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.OKBtn];
    
    self.OKBtn.layer.masksToBounds = YES;
    self.OKBtn.layer.cornerRadius = 5;
    [self.OKBtn setTitle:@"登录" forState:UIControlStateNormal];
    //    [self.OKBtn addTarget:self action:@selector(clickbtn) forControlEvents:UIControlEventTouchUpInside];
    
    //rac 为按钮添加方法
    [[self.OKBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     
     subscribeNext:^(UIButton *sender) {
         
         NSLog(@"OK按钮被点击");
     }
     
     ];
    
    //使用RAC监听textvfild的变化
    [self.accountTextFiled.rac_textSignal subscribeNext:^(id  _Nullable x) {
        NSString *name = x;
        
        NSLog(@"%@",name);
        
    }];
    
    //RAC 的过滤效果
    [[self.passwordTextFiled.rac_textSignal filter:^BOOL(id value) {
        NSString *text = value;
        BOOL k = [text isEqualToString:@"123"];
        
        return k;
        
    }] subscribeNext:^(id  _Nullable x) {
        //只用当密码输入123的时候 才会打印
        
        NSLog(@"==========");
    }];
    
    // 改变订阅者收到的信息
//    [[self.passwordTextFiled.rac_textSignal map:^id(NSString * str) {
//        return [str boolValue]?[UIColor greenColor]:[UIColor yellowColor];
//    }] subscribeNext:^(UIColor *x) {
//        //实现的功能：输入框有变化时改变self.view的背景颜色
//        
//        //之前我们subscribe收到的都是输入框的文本内容，现在我们要做的就是改变订阅者收到的信息。
//        self.view.backgroundColor = x;
//    }];
    
    //对上面的优化
    
    RAC(self.view,backgroundColor) = [self.passwordTextFiled.rac_textSignal map:^id(NSString *passwordValid) {
        
        return [passwordValid boolValue]?[UIColor greenColor]:[UIColor yellowColor];
    }];
    /*起初咱们说到RAC框架有以下几个特点：
     
     1、能够使业务逻辑更清晰
     
     2、减少代码量
     
     3、大量使用block
     
     最后必须要记住的一点是它能做到这一步最为重要的一个原因是
     
     将代理、KVO、通知、callBack等一系列事件，做了一个统一管理。
     */
    
    
}

/**
 正式使用RAC
 */
- (void)tianjiarac
{
    /**
     *RAC中最为重要的概念是信号流。通过对信号流进行操作从而达到我们想要的效果，不仅能对单一信号流操作，还能对多个信号流合并。
     *实现上面的需求我们需要做一下两个工作
     
     *1.获取到账号和密码的信号流，并放到一个一个数组里
     2. 通过rac将信号流进行合并，在block块中进行操作
     */
    // rac 获取信号流
    RACSignal *passwordSignal = self.passwordTextFiled.rac_textSignal;
    RACSignal *accountSignal = self.accountTextFiled.rac_textSignal;
    //将两个信号流放在数组中
    NSArray *signalArray = [NSArray arrayWithObjects:passwordSignal, accountSignal,nil];
    
    //RAC(self.OKBtn,backgroundColor): RAC()其实就是一个宏定义，第一个参数就是你想要给谁设置属性，第二个参数就是给他设置什么样的属性
    // combine :合并两个信号
    
    //reduce 在reduce的block中进行逻辑操作。reduce需要返回一个值，比如我们需要设置okbtn 的背景色，在这我们做出相应判断返回相应的背景色即可
    
    RAC(self.OKBtn,backgroundColor) = [RACSignal combineLatest:signalArray reduce:^id{
        if (self.passwordTextFiled.text.length !=0 && self.accountTextFiled.text.length !=0) {
            return [UIColor redColor];
            
        }
        return [UIColor grayColor];
    }];
    
}




/**
 自定义导航
 */
- (void)mydaohang
{
    MyNaVC *mynavc = [[MyNaVC alloc]init];
    [mynavc initwithcolor:[UIColor redColor] title:@"RAC和注释"] ;
    [mynavc.btn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mynavc];
}


//返回
- (void)fanhui
{
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
