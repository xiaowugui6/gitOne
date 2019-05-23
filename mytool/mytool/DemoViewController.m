//
//  DemoViewController.m
//  mytool
//
//  Created by  cheyong on 17/6/22.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "DemoViewController.h"
#import "AddfViewController.h"
@interface DemoViewController ()<UITableViewDelegate,UITableViewDataSource,AddfViewControllerDelegate,UIGestureRecognizerDelegate>
@property (nonatomic,strong)UITableView *mytable;
//数据源
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation DemoViewController
- (UITableView *)mytable
{
    if (!_mytable) {
        _mytable  = [[UITableView alloc] initWithFrame:CGRectMake(0, 64,k_w, k_h - 64) style:UITableViewStylePlain];
        _mytable.dataSource = self;
        _mytable.delegate = self;
        //_mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
//        [_mytable registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"resuseId"];
        
        
    }
    
    
    return _mytable ;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"refuse"];
    
    if (!cell) {
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"refuse"];
    }
   cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
    
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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mydaohang];
    [self.view addSubview:self.mytable];
    _dataArray = [[NSMutableArray alloc]initWithObjects:@"衣服", nil];
    
    
        
    
    // Do any additional setup after loading the view.
}
/**
 自定义导航
 */
- (void)mydaohang
{
    MyNaVC *mynavc = [[MyNaVC alloc]init];
    [mynavc initwithcolor:[UIColor redColor] title:@"生活管家"] ;
    [mynavc.btn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    UIButton *addbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addbtn.frame = CGRectMake(k_w-50, 20, 50, 44);
    [addbtn setTitle:@"录入" forState:UIControlStateNormal];
    [addbtn addTarget:self action:@selector(tianjia) forControlEvents:UIControlEventTouchUpInside];
    
    [mynavc addSubview:addbtn];
    
    [self.view addSubview:mynavc];
}
- (void)tianjia
{
    NSLog(@"%s录入",__func__ );
    AddfViewController *addVC = [[UIStoryboard storyboardWithName:@"Tools" bundle:nil] instantiateViewControllerWithIdentifier:@"add"];
    addVC.delegate = self;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addVC animated:YES];
    
}
//调用代理 实现逆向传值
- (void)passName:(NSString *)name
{
    [_dataArray addObject:name];
    [self.mytable reloadData];
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
