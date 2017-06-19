//
//  ZLTimeBtn.m
//  ZLAppointment
//
//  Created by ZL on 2017/6/19.
//  Copyright © 2017年 zhangli. All rights reserved.
//

#import "ZLTimeBtn.h"
#import "NSDate+ZLDateTimeStr.h"

@implementation ZLTimeBtn

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor clearColor];
    [self setImage:[UIImage imageNamed:@"xiangxiadianji"] forState:UIControlStateNormal];
    [self setTitle:[self timeStringDefault] forState:UIControlStateNormal];
    [self setTitleColor:ZLColor(102, 102, 102) forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
}

- (NSString *)timeStringDefault {
    NSDate *date = [NSDate date];
    return [date timeFormat:@"yyyy-MM-dd"];
}

@end
