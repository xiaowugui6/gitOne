//
//  CopyLabel.m
//  mytool
//
//  Created by Ios on 2018/1/3.
//  Copyright © 2018年 xiaojia. All rights reserved.
//

#import "CopyLabel.h"

@implementation CopyLabel
#pragma mark <*使CopyLabel可以成为第一响应者*>
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self pressAction];
    }
    return self;
}
- (void)pressAction {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPress.minimumPressDuration = 1;
    [self addGestureRecognizer:longPress];
}

- (void)longPressAction:(UIGestureRecognizer *)recognizer {
    [self becomeFirstResponder];
    UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"拷贝" action:@selector(customCopy:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyItem, nil]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
}


- (BOOL)canBecomeFirstResponder
{
    return YES;
}
//使CopyLabel可响应copyText命令
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return action == @selector(customCopy:);
}
- (void)customCopy:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.text;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
