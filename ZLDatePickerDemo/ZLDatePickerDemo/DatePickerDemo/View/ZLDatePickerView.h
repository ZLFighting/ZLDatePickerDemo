//
//  ZLDatePickerView.h
//  ZLAppointment
//
//  Created by ZL on 2017/6/19.
//  Copyright © 2017年 zhangli. All rights reserved.
//  时间选择器Picker

#import <UIKit/UIKit.h>
@class ZLDatePickerView;

@protocol ZLDatePickerViewDelegate <NSObject>

- (void)datePickerView:(ZLDatePickerView *)pickerView backTimeString:(NSString *)string To:(UIView *)view;

@end

@interface ZLDatePickerView : UIView

@property (nonatomic, assign) id<ZLDatePickerViewDelegate> deleagte;
// 最初/小时间(一般为左边值)
@property (nonatomic, strong) NSDate *minimumDate;
// 截止时间(一般为右边值)
@property (nonatomic, strong) NSDate *maximumDate;
// 当前选择时间
@property (nonatomic, strong) NSDate *date;


+ (instancetype)datePickerView;

- (void)showFrom:(UIView *)view;

@end
