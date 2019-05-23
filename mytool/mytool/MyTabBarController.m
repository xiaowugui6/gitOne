//
//  MyTabBarController.m
//  mytool
//
//  Created by  cheyong on 17/5/8.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyNavigationController.h"
#import "PhotoViewController.h"
#import "ToolsViewController.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildViewController];
    [self mytabbar];
    //self.delegate = self;
}
- (void)mytabbar
{
    // 设置一个自定义 View,大小等于 tabBar 的大小
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    // 给自定义 View 设置颜色
    bgView.backgroundColor = UIColorFromRGB(0x0292e32);
    // 将自定义 View 添加到 tabBar 上
    [self.tabBar insertSubview:bgView atIndex:0];
    
    self.tabBar.tintColor = UIColorFromRGB(0xF37880);
    
    
}



//为tabBar添加按钮
- (void)setupAllChildViewController
{
    ToolsViewController *mytool = [[UIStoryboard storyboardWithName:@"Tools" bundle:nil] instantiateViewControllerWithIdentifier:@"ToolVC"];
    [self setupChildViewController:mytool title:@"工具" imageName:@"tools" selectedImageName:@""];
    
    
    
    //PhotoViewController *photo = [[PhotoViewController alloc]init];

    PhotoViewController *photo = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"photo"];
    //photo.view.backgroundColor = [UIColor purpleColor];
    [self setupChildViewController:photo title:@"我的照片" imageName:@"photo" selectedImageName:@""];
    
    UIViewController *aphoto = [[UIViewController alloc]init];
    aphoto.view.backgroundColor = [UIColor greenColor];
    [self setupChildViewController:aphoto title:@"我的音乐" imageName:@"03" selectedImageName:@""];
}

/*
 * 初始化一个子控制器
 * childVc 子控制器
 * title   控制器标题
 */
- (void)setupChildViewController:(UIViewController*)childVc title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    if (IOS7) {
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //显示原图
        childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    }else
    {
        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
        
    }
    MyNavigationController *nav = [[MyNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
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
