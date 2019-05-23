//
//  XianChengViewController.m
//  mytool
//
//  Created by  cheyong on 17/8/31.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "XianChengViewController.h"
 static int a ;
@interface XianChengViewController ()

@end

@implementation XianChengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mydaohang];
    self.view.backgroundColor = [UIColor greenColor];
    //主线程打印1
    NSLog(@"1=====%@",[NSThread currentThread]);
    //在主线程打印2而且是同步执行的     这时造成线程锁死
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"2=====%@",[NSThread currentThread]);
//        
//    });

//    NSLog(@"2=====%@",[NSThread currentThread]);
//    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"2====%@",[NSThread currentThread]);
//    });
    
    //异步执行
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2=====%@",[NSThread currentThread]);
        
    });
    
    
    NSLog(@"3=====%@",[NSThread currentThread]);
    //主队列延时
    dispatch_time_t when_main = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC ));
    dispatch_after(when_main, dispatch_get_main_queue(), ^{
        NSLog(@"main __是不3秒%@",[NSThread currentThread] );
        
        
    });
    
    //全局队列延时
    dispatch_time_t when_global = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC));
    
    dispatch_after(when_global, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),^{
        
        NSLog(@"global_%@",[NSThread currentThread]);
        
    });
    
   
    
    
    
    
    
    [self performSelector:@selector(yanshi) withObject:nil afterDelay:3];
    
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"执行一次%@",[NSThread  currentThread]);
        
    });
   
    a++;
    NSLog(@"点击次数%d",a);
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //a =0;
}
- (void)yanshi
{
    NSLog(@"也是三秒");
}
/**
 自定义导航
 */
- (void)mydaohang
{
    MyNaVC *mynavc = [[MyNaVC alloc]init];
    [mynavc initwithcolor:[UIColor whiteColor] title:@"线程"] ;
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
