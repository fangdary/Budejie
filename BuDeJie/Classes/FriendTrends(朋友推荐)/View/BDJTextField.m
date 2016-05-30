//
//  BDJTextField.m
//  BuDeJie
//
//  Created by  方伟易 on 2016/5/30.
//  Copyright © 2016年 EvilGoose. All rights reserved.
//

#import "BDJTextField.h"

@implementation BDJTextField

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
- (void)drawRect:(CGRect)rect {
    
    //挡不住
    //修改占位文字的颜色
    NSDictionary *dict = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:14.0],
                           NSForegroundColorAttributeName : [UIColor yellowColor],
                           };
    CGRectMake(0, 0, rect.size.width, rect.size.height);
    [self.placeholder drawInRect:rect withAttributes:dict];
}
*/

- (void)awakeFromNib {
    //修改光标的颜色
    self.tintColor = [UIColor whiteColor];

    //修改占位文字及文字颜色
    [self setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIColor whiteColor] forKeyPath:@"textColor"];
}

@end
