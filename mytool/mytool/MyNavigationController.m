//
//  MyNavigationController.m
//  mytool
//
//  Created by  cheyong on 17/5/8.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//重新写navigation的push方法  隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    viewController.navigationController.navigationBar.hidden = YES;
    viewController.hidesBottomBarWhenPushed = NO;
    
    
}
- (UIViewController*)popViewControllerAnimated:(BOOL)animated
{
    return [super popViewControllerAnimated:animated];
    
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
