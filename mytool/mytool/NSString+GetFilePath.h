//
//  NSString+GetFilePath.h
//  mytool
//
//  Created by  cheyong on 17/8/2.
//  Copyright © 2017年 xiaojia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GetFilePath)
//返回文件夹和文件名路径(得到路径可能存在，也可能不存在)
+ (NSString* )getFilePath:(NSString* )filePath withFileName:(NSString* )fileName;
//把汉字转化为拼音
- (NSString*)getTransformString;

//返回文件路径（必须存在）
+ (NSString* )getExistsFilePath:(NSString* )filePath withFileName:(NSString* )fileName;


@end
