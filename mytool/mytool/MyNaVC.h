//
//  MyNaVC.h
//  mytool
//
//  Created by  cheyong on 17/6/8.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNaVC : UIView

@property (nonatomic,strong)UILabel *titlelabel;
@property (nonatomic,strong)UIButton *btn;

- (void)initwithcolor:(UIColor*)mycolor title:(NSString*)title;
@end
