//
//  XWAlertView.h
//  mytool
//
//  Created by  cheyong on 17/5/15.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYPasswordView.h"
@protocol XWAlertViewdelegate <NSObject>

- (void)didClickButtonAtIndex:(NSUInteger)index password:(NSString*)password;


@end


@interface XWAlertView : UIView<UITextFieldDelegate,PasDelegate>
@property (nonatomic,assign)id <XWAlertViewdelegate>delegate;

@property (nonatomic,strong)UIView *blackView;
@property (strong,nonatomic)UIView * alertview;
@property (nonatomic,retain)NSArray *btnTitleArr;
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,assign)NSInteger numBtn;
@property (strong,nonatomic)NSString * title;
@property (nonatomic,copy)NSString *contentStr;
@property (nonatomic,strong)UILabel *tipLable;
@property (nonatomic,retain)UITextField *textF;
@property (nonatomic,copy)NSString *password;
-(void)initWithTitle:(NSString *) title contentStr:(NSString *)content type:(NSInteger)type btnNum:(NSInteger)btnNum btntitleArr:(NSArray *)btnTitleArr;

@property (nonatomic,strong)SYPasswordView * pasView;
@property (nonatomic,strong)UIButton *mybtn;

@end
