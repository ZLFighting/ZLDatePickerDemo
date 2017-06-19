//
//  NSDate+ZLDateTimeStr.h
//  ZLAppointment
//
//  Created by ZL on 2017/6/19.
//  Copyright © 2017年 zhangli. All rights reserved.
//  时间转化

#import <Foundation/Foundation.h>

@interface NSDate (ZLDateTimeStr)

// 时间转字符串
- (NSString *)timeFormat:(NSString *)dateFormat;

// 字符串转时间
+ (NSDate *)stringChangeTimeFormat:(NSString *)dateFormat string:(NSString *)string;

@end
