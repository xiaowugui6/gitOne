//
//  ToolsViewController.m
//  mytool
//
//  Created by  cheyong on 17/6/7.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "ToolsViewController.h"
#import "RACViewController.h"
#import "DemoViewController.h"
#import "JianBianViewController.h"
#import "CategoryViewController.h"
#import "XianChengViewController.h"
@interface ToolsViewController ()
@property (weak, nonatomic) IBOutlet UIView *headview;

@end

@implementation ToolsViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headview;
    //是否有20的状态栏
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
   
}
//这是分几个区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
// 每个区有几个单元格
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//单元格的类型
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *firstsection = @"first";
    static NSString *secondsection = @"second";
    static NSString *jianbian = @"jianbian";
    static NSString *category = @"category";
    static NSString *xiancheng = @"xiancheng";
    UITableViewCell *cell = nil;
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:firstsection];
            break;
            
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:secondsection];
            break;
        case 2:
            
            cell = [tableView dequeueReusableCellWithIdentifier:jianbian];
            break;
        case 3:
            
            cell = [tableView dequeueReusableCellWithIdentifier:category];
            break;
        case 4:
            
            cell = [tableView dequeueReusableCellWithIdentifier:xiancheng];
            break;



        default:
            break;
    }
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            RACViewController *racVC =  [[RACViewController alloc]init];
            
            [self.navigationController pushViewController:racVC animated:YES];
        }
            break;
        case 1:
        {
            DemoViewController *demo = [[UIStoryboard storyboardWithName:@"Tools" bundle:nil]instantiateViewControllerWithIdentifier:@"demo"];
            
            [self.navigationController pushViewController:demo animated:YES];
            
        }
            break;
        case 2:
        {
            JianBianViewController *racVC =  [[JianBianViewController alloc]init];
            
            [self.navigationController pushViewController:racVC animated:YES];
        }
            break;
        case 3:
        {
            CategoryViewController *categoryVC =  [[CategoryViewController alloc]init];
            
            [self.navigationController pushViewController:categoryVC animated:YES];
        }
            break;
        case 4:
        {
            XianChengViewController *categoryVC =  [[XianChengViewController alloc]init];
            
            [self.navigationController pushViewController:categoryVC animated:YES];
        }
            break;




        default:
            break;
    }
    
    
    
}
//返回单元格的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1)
        return 50;
    //此方法可以用来隐藏cell
    return 60;
//    [self.tableView  beginUpdates];
//    [self.tableView endUpdates];

}
//区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}
//区尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
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
