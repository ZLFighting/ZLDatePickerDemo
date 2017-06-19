//
//  ZLOppositeButton.m
//  ZLAppointment
//
//  Created by ZL on 2017/6/19.
//  Copyright © 2017年 zhangli. All rights reserved.
//

#import "ZLOppositeButton.h"

@implementation ZLOppositeButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = 10;
    
    // 替换 title 和 image 的位置
    // 图片在右,标题在左
    // 由于 button 内部的尺寸是自适应的.调整尺寸即可
    CGFloat maxWidth = self.width - self.imageView.width - margin;
    if (self.titleLabel.width >= maxWidth) {
        self.titleLabel.width = maxWidth;
    }
    
    CGFloat totalWidth = self.titleLabel.width + self.imageView.width;
    
    self.titleLabel.x =  (self.width - totalWidth - margin) * 0.5;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + margin;
}

@end
