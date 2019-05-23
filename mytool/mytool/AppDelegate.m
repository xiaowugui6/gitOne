//
//  AppDelegate.m
//  mytool
//
//  Created by  cheyong on 17/4/11.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "AppDelegate.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "XWAlertView.h"
#import "SDAutoLayout.h"
@interface AppDelegate ()<XWAlertViewdelegate>
@property (nonatomic,strong)UIScrollView *xiaowei_launchScroll;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _tab = [[MyTabBarController alloc]init];
    _tab.selectedViewController = _tab.viewControllers[0];
    self.window.rootViewController = _tab;
   
    NSLog(@"123");
   // [self fingerrecongnize];
    //禁止手机休眠
    //[UIApplication sharedApplication].idleTimerDisabled = YES;
    NSLog(@"456");
    
    return YES;
}
#pragma 懒加载
- (UIScrollView *)xiaowei_launchScroll
{
    if (!_xiaowei_launchScroll) {
        _xiaowei_launchScroll  = [[UIScrollView  alloc]initWithFrame:[UIScreen mainScreen].bounds];
        UIImageView *first = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"leading_1"]];
        first.frame = CGRectMake(0, 0, k_w, k_h);
        UIImageView *second = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"leading_2"]];
        second.frame = CGRectMake(k_w, 0, k_w, k_h);
        UIImageView *third = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"leading_3"]];
        third.frame = CGRectMake(k_w*2, 0, k_w, k_h);
        third.userInteractionEnabled = YES;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"leading_btn"] forState:UIControlStateNormal];
        [third addSubview:button];
        [button addTarget:self action:@selector(removexiaoweiscroll) forControlEvents:UIControlEventTouchUpInside];
        
        button.sd_layout.centerXEqualToView(third).bottomSpaceToView(third,85).heightIs(45).widthIs(200);
        [_xiaowei_launchScroll addSubview:first];
        [_xiaowei_launchScroll addSubview:second];
        [_xiaowei_launchScroll addSubview:third];
        _xiaowei_launchScroll.contentSize = CGSizeMake(k_w*3, k_h);
        _xiaowei_launchScroll.bounces = NO;
        _xiaowei_launchScroll.showsVerticalScrollIndicator = NO;
        _xiaowei_launchScroll.showsHorizontalScrollIndicator = NO;
        _xiaowei_launchScroll.pagingEnabled = YES;
    }
    
    
    return _xiaowei_launchScroll ;
    
}
- (void)removexiaoweiscroll
{
    [self.xiaowei_launchScroll removeFromSuperview];
    //设置第一次
    setfirst;
    XWAlertView *alert = [[XWAlertView alloc]initWithFrame:CGRectMake(0, 0, k_w, k_h)];
    [alert initWithTitle:@"123" contentStr:@"确定要退出？？？" type:67 btnNum:2 btntitleArr:[NSArray arrayWithObjects:@"取消",@"提交", nil]];
    alert.delegate = self;
    [self.tab.view addSubview:alert];

}

- (void)fingerrecongnize
{
    //1. 判断系统版本
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        //2. LAContext : 本地验证对象上下文
        LAContext *context = [LAContext new];
        
        
        //3. 判断是否可用
        //Evaluate: 评估  Policy: 策略,方针
        //LAPolicyDeviceOwnerAuthenticationWithBiometrics: 允许设备拥有者使用生物识别技术
        if (![context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil]) {
            NSLog(@"对不起, 指纹识别技术暂时不可用");
           
            
            
            
            
            _tab = [[MyTabBarController alloc]init];
            _tab.selectedViewController = _tab.viewControllers[0];
            self.window.rootViewController = _tab;
            //判断是否是第一次
            if (![isfirst boolValue]) {
                 [self.window.rootViewController.view addSubview:self.xiaowei_launchScroll];
            }
           
            

            
        }
        
        //4. 开始使用指纹识别
        //localizedReason: 指纹识别出现时的提示文字, 一般填写为什么使用指纹识别
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"通过home键进行指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
            
            if (success) {
                NSLog(@"指纹识别成功");
                // 指纹识别成功，回主线程更新UI,弹出提示框
                                dispatch_async(dispatch_get_main_queue(), ^{
                
                                    _tab = [[MyTabBarController alloc]init];
                                    _tab.selectedViewController = _tab.viewControllers[0];
                                   // self.window.rootViewController = _tab;
                                    
                                    //动画加载Window的根控制器
                                    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                                        BOOL oldState = [UIView areAnimationsEnabled];
                                        [UIView setAnimationsEnabled:NO];
                                        self.window.rootViewController = _tab;
                                        [UIView setAnimationsEnabled:oldState];
                                        
                                    } completion:^(BOOL finished) {
                                        
                                    }];

                                    //自定义弹出框
                                    XWAlertView *alert = [[XWAlertView alloc]initWithFrame:CGRectMake(0, 0, k_w, k_h)];
                                    [alert initWithTitle:@"123" contentStr:@"确定要退出？？？" type:67 btnNum:2 btntitleArr:[NSArray arrayWithObjects:@"取消",@"提交", nil]];
                                    alert.delegate = self;
                                    [self.tab.view addSubview:alert];

                                    
                                });
                
            }
            
            if (error) {
                
                // 错误的判断chuli
                
                if (error.code == -2) {
                    NSLog(@"用户取消了操作");
                    
                } else {
                    NSLog(@"错误: %@",error);
                }
                
            }
            
        }];
    }else {
        
        NSLog(@"对不起, 该手机不支持指纹识别");
        
        
        
    }
    

}
- (void)didClickButtonAtIndex:(NSUInteger)index password:(NSString *)password
{
    NSLog(@"%lu===%@",(unsigned long)index,password);
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
