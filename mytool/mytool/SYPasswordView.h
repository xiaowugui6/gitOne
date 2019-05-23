//
//  SYPasswordView.h
//  PasswordDemo
//
//  Created by aDu on 2017/2/6.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  PasDelegate<NSObject>
- (void)password:(NSString*)password;

@end
@interface SYPasswordView : UIView<UITextFieldDelegate>
@property (nonatomic,assign)id<PasDelegate> delegate;
/**
 *  清除密码
 */
- (void)clearUpPassword;

@end
