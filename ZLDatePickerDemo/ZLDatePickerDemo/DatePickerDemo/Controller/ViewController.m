//
//  ViewController.m
//  ZLDatePickerDemo
//
//  Created by ZL on 2017/6/19.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "ViewController.h"
#import "ZLTimeView.h"


@interface ViewController () <ZLTimeViewDelegate>

@property (nonatomic, copy) NSString *begintime;
@property (nonatomic, copy) NSString *endtime;

@property (nonatomic, weak) UIButton *beginTimeBtn;
@property (nonatomic, weak) UIButton *endTimeBtn;

@property (nonatomic, strong) ZLTimeView *timeView;

@end

@implementation ViewController

#pragma mark - 懒加载

- (ZLTimeView *)timeView {
    if (!_timeView) {
        ZLTimeView *timeView = [[ZLTimeView alloc] initWithFrame:CGRectMake(0, 100, UI_View_Width, 50)];
        timeView.backgroundColor = [UIColor greenColor];
        timeView.delegate = self;
        _timeView = timeView;
    }
    return _timeView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 时间选择控件
    [self.view addSubview:self.timeView];
}

#pragma mark - ZLTimeViewDelegate

- (void)timeView:(ZLTimeView *)timeView seletedDateBegin:(NSString *)beginTime end:(NSString *)endTime {
    // TODO: 进行上传时间段
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
