//
//  NSDate+ZLDateTimeStr.m
//  ZLAppointment
//
//  Created by ZL on 2017/6/19.
//  Copyright © 2017年 zhangli. All rights reserved.
//

#import "NSDate+ZLDateTimeStr.h"

@implementation NSDate (ZLDateTimeStr)

- (NSString *)timeFormat:(NSString *)dateFormat {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:dateFormat];
    
    return [formatter stringFromDate:self];
}

+ (NSDate *)stringChangeTimeFormat:(NSString *)dateFormat string:(NSString *)string {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:dateFormat];
    
    return [formatter dateFromString:string];
    
}

@end
