//
//  ZLTimeView.h
//  ZLAppointment
//
//  Created by ZL on 2017/6/19.
//  Copyright © 2017年 zhangli. All rights reserved.
//  自定义时间选择器视图

#import <UIKit/UIKit.h>
@class ZLTimeView;

@protocol ZLTimeViewDelegate <NSObject>

/**
 *  时间选择器视图
 *
 *  @param beginTime           起始时间/开始时间
 *  @param endTime             终止时间按/结束时间
 *
 */
- (void)timeView:(ZLTimeView *)timeView seletedDateBegin:(NSString *)beginTime end:(NSString *)endTime;

@end

@interface ZLTimeView : UIView

@property (nonatomic, weak) id<ZLTimeViewDelegate> delegate;

@end
