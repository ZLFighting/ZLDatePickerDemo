//
//  ZLTimeView.m
//  ZLAppointment
//
//  Created by ZL on 2017/6/19.
//  Copyright © 2017年 zhangli. All rights reserved.
//

#import "ZLTimeView.h"
#import "ZLTimeBtn.h"
#import "ZLDatePickerView.h"
#import "NSDate+ZLDateTimeStr.h"

@interface ZLTimeView () <ZLDatePickerViewDelegate>

@property (nonatomic, weak) ZLTimeBtn *beginTimeBtn;
@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) ZLTimeBtn *endTimeBtn;
@property (nonatomic, weak) UIView *line;

@property (nonatomic, strong) NSDate *minDate;
@property (nonatomic, strong) NSDate *maxDate;
@end

@implementation ZLTimeView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupSubview];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview {
    // 起始时间按钮
    ZLTimeBtn *beginTimeBtn = [[ZLTimeBtn alloc] init];
    beginTimeBtn.backgroundColor = [UIColor clearColor];
    [beginTimeBtn addTarget:self action:@selector(beginTimeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:beginTimeBtn];
    self.beginTimeBtn = beginTimeBtn;
    
    // 至label
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"至";
    label.textColor = ZLColor(102, 102, 102);
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    self.label = label;
    [self addSubview:label];
    
    // 终止时间按钮
    ZLTimeBtn *endTimeBtn = [[ZLTimeBtn alloc] init];
    [endTimeBtn addTarget:self action:@selector(endTimeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.endTimeBtn = endTimeBtn;
    [self addSubview:endTimeBtn];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = ZLColor(204, 204, 204);
    self.line = line;
    [self addSubview:line];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.beginTimeBtn.frame = CGRectMake(0, 0, self.width / 5.0 * 2, self.height);
    self.label.frame = CGRectMake(CGRectGetMaxX(self.beginTimeBtn.frame), 0, self.width / 5, self.height);
    self.endTimeBtn.frame = CGRectMake(CGRectGetMaxX(self.label.frame),0 , self.width / 5.0 * 2, self.height);
    self.line.frame = CGRectMake(0, self.height - 1, self.width, 1);
}

#pragma mark - ZLDatePickerViewDelegate

- (void)beginTimeBtnClick:(UIButton *)btn {
    
    ZLDatePickerView *beginTimePV = [ZLDatePickerView datePickerView];
    beginTimePV.date = [NSDate stringChangeTimeFormat:@"yyyy-MM-dd" string:btn.titleLabel.text];
    if (self.maxDate) {
        beginTimePV.maximumDate = self.maxDate;
    }
    beginTimePV.deleagte = self;
    [beginTimePV showFrom:btn];
}

- (void)endTimeBtnClick:(UIButton *)btn {
    
    ZLDatePickerView *endTimePV = [ZLDatePickerView datePickerView];
    endTimePV.date = [NSDate stringChangeTimeFormat:@"yyyy-MM-dd" string:btn.titleLabel.text];
    if (self.minDate) {
        endTimePV.minimumDate = self.minDate;
    }
    
    endTimePV.deleagte = self;
    [endTimePV showFrom:btn];
}

- (void)datePickerView:(ZLDatePickerView *)pickerView backTimeString:(NSString *)string To:(UIView *)view {
    UIButton *btn = (UIButton *)view;
    if (btn == self.beginTimeBtn) {
        self.minDate = [NSDate stringChangeTimeFormat:@"yyyy-MM-dd" string:string];
    }
    if (btn == self.endTimeBtn) {
        self.maxDate = [NSDate stringChangeTimeFormat:@"yyyy-MM-dd" string:string];
    }
    
    [btn setTitle:string forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(timeView:seletedDateBegin:end:)]) {
        [self.delegate timeView:self seletedDateBegin:self.beginTimeBtn.titleLabel.text end:self.endTimeBtn.titleLabel.text];
    }
}

@end
