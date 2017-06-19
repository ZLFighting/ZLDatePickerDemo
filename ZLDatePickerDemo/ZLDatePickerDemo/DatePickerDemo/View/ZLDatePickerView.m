//
//  ZLDatePickerView.m
//  ZLAppointment
//
//  Created by ZL on 2017/6/19.
//  Copyright © 2017年 zhangli. All rights reserved.
//

#import "ZLDatePickerView.h"

@interface ZLDatePickerView () 

// 取消按钮
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
// 确认按钮
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
// 时间选择器视图
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic, weak) UIView *bgView;
@property (nonatomic, weak) UIView *fromView;

@end

@implementation ZLDatePickerView


- (void)awakeFromNib {
    
    self.cancelBtn.layer.cornerRadius = ZL_btnCornerRadius;
    self.cancelBtn.layer.borderColor = ZLColor(153, 153, 153).CGColor; // 设置边框颜色
    [self.cancelBtn.layer setBorderWidth:1.0];
    
    self.sureBtn.layer.cornerRadius = ZL_btnCornerRadius;
}

+ (instancetype)datePickerView {
    
    ZLDatePickerView *picker = [[NSBundle mainBundle] loadNibNamed:@"ZLDatePickerView" owner:nil options:nil].lastObject;
    picker.frame = CGRectMake(0, UI_View_Height - 250, UI_View_Width, 250);
    picker.maximumDate = [NSDate date];
    
    return picker;
}

- (void)showFrom:(UIView *)view {
    UIView *bgView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    bgView.backgroundColor = [UIColor lightGrayColor];
    bgView.alpha = 0.5;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [bgView addGestureRecognizer:tap];
    
    self.fromView = view;
    self.bgView = bgView;
    [[UIApplication sharedApplication].keyWindow addSubview:self.bgView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    [self dismiss];
}

- (IBAction)cancel:(id)sender {
    [self dismiss];
}

- (IBAction)makeSure:(id)sender {
    
    [self dismiss];
    
    NSDate *date = self.datePicker.date;
    
    if ([self.deleagte respondsToSelector:@selector(datePickerView:backTimeString:To:)]) {
        [self.deleagte datePickerView:self backTimeString:[self fomatterDate:date] To:self.fromView];
    }
}

- (void)setMinimumDate:(NSDate *)minimumDate {
    self.datePicker.minimumDate = minimumDate;
}

- (void)setMaximumDate:(NSDate *)maximumDate {
    self.datePicker.maximumDate = maximumDate;
}

- (void)setDate:(NSDate *)date {
    self.datePicker.date = date;
}

- (void)dismiss {
    [self.bgView removeFromSuperview];
    [self removeFromSuperview];
}

- (NSString *)fomatterDate:(NSDate *)date {
    NSDateFormatter *fomatter = [[NSDateFormatter alloc] init];
    fomatter.dateFormat = @"yyyy-MM-dd";
    return [fomatter stringFromDate:date];
}


@end
