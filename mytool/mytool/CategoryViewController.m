//
//  CategoryViewController.m
//  mytool
//
//  Created by  cheyong on 17/8/2.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "CategoryViewController.h"
#import "NSString+GetFilePath.h"
#import "XHMessageTextView.h"
#import "UIView+Boom.h"
@interface CategoryViewController ()
@property (nonatomic,strong)UIImageView *baozha;
@end

@implementation CategoryViewController
#pragma 懒加载
- (UIImageView *)baozha
{
    if (!_baozha) {
        _baozha  = [[UIImageView  alloc]init];
        _baozha.frame = CGRectMake(100, 200, 100, 100);
        _baozha.image = [UIImage imageNamed:@"wode"];
        _baozha.userInteractionEnabled = YES;
    }
    
    
    return _baozha ;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //导航
    [self mydaohang];
    //类别
    [self leibieandpinyin];
    
    XHMessageTextView *textview = [[XHMessageTextView alloc]init];
    textview.frame = CGRectMake(0, 70, k_w, 100);
    textview.backgroundColor = [UIColor greenColor];
    textview.placeHolder = @"怎么还是放不下的";
    [self.view addSubview:textview];
  
    [self.view addSubview:self.baozha];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap)];
    [self.baozha addGestureRecognizer:singleTap];
    
}
- (void)singleTap
{
    
    [self GCDMethod:self.baozha afterTime:0.001];
}
- (void)GCDMethod:(UIView*)myView afterTime:(NSTimeInterval)interval{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [myView boom];
    });
    
}

/**
 类别和汉字转拼音
 */
- (void)leibieandpinyin
{
    //加号方法用类名调用
    NSString *shishi = [NSString getFilePath:@"123" withFileName:@"456"];
    NSLog(@"=======%@",shishi);
    //减号方法用用对象调用
    NSString *hanzi = @"奋斗不止";
    NSString *pingyin = [hanzi getTransformString];
    NSLog(@"%@=%@",hanzi,pingyin);
    
    NSString *zailai = [NSString getExistsFilePath:@"789" withFileName:@"110"];
    NSLog(@"///////%@",zailai);

}

/**
 爆炸动画
 */
- (void)baoza
{
    
}

/**
 自定义导航
 */
- (void)mydaohang
{
    MyNaVC *mynavc = [[MyNaVC alloc]init];
    [mynavc initwithcolor:[UIColor redColor] title:@"类别的使用"] ;
    [mynavc.btn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mynavc];
}


//返回
- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
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
