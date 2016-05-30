//
//  BDJQucikLoginBtn.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/29/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJQucikLoginBtn.h"

#import "UIView+Extension.h"

@implementation BDJQucikLoginBtn

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //设置图片位置
    self.imageView.centerX = self.width * 0.5;
    self.imageView.y = 0;
    
    //设置标题位置
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
    
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
}

@end
