//
//  PhotoViewController.m
//  mytool
//
//  Created by  cheyong on 17/5/15.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import "PhotoViewController.h"
#import "XWAlertView.h"
#import "CopyLabel.h"
@interface PhotoViewController ()
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // CopyLabel *label = [[CopyLabel alloc]
    CopyLabel *label = [[CopyLabel alloc]initWithFrame:CGRectMake(10, 100, 100, 40)];
    label.text = @"复制测试";
    [self.view addSubview:label];
    
    
}
- (IBAction)copyBtn:(UIButton *)sender {
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    
    NSString *string = @"复制测试文本";
    
    [pab setString:string];
    
    
    if (pab == nil)
        
    {
        NSLog(@"复制失败");
        
    }
    
    else
    {
        NSLog(@"复制成功");
    }
}


#pragma mark =============== 内存警告 ===============
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
