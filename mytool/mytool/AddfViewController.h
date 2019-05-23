//
//  AddfViewController.h
//  mytool
//
//  Created by  cheyong on 17/6/22.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 自定义代理 实现逆向传值
 */
@protocol AddfViewControllerDelegate<NSObject>

/**
 代理传值的方法

 @param name 要传递的值
 */
- (void)passName:(NSString*)name;

@end
@interface AddfViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameText;

@property (weak, nonatomic) IBOutlet UITextField *beizhuText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *beizhuHeight;
@property (weak, nonatomic) IBOutlet UITextView *beizhuTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeight;


@property (weak,nonatomic) id<AddfViewControllerDelegate>delegate;
@end
