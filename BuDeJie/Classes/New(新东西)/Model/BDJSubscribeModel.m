//
//  BDJSubscribeModel.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/29/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJSubscribeModel.h"

@implementation BDJSubscribeModel

//重写set 方法
- (void)setSub_number:(NSString *)sub_number {
    if ([sub_number intValue] > 10000) {
        _sub_number = [NSString stringWithFormat:@"%.2f 万订阅", ([sub_number intValue] / 10000.0)];
    }else
    _sub_number = [NSString stringWithFormat:@"%@ 订阅", sub_number];
}

@end
