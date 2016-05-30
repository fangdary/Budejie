//
//  UITabBar+InsetItem.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/26/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

/**
 *  插入一个自定义View到tabbar 中
 *
 *  @param InsetItem 自定义View
 *
 *  @return 插入View后的tabbat
 */

#import "UITabBar+InsetItem.h"

@implementation UITabBar (InsetItem)

- (void)tabBarInsertView:(UIView *)insertView atIndex:(NSInteger)index {

    CGFloat width = self.bounds.size.width / (self.items.count + 1);
    CGFloat height = self.bounds.size.height;
    
    __block NSInteger count = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //判断是否是UIBarButtonItem
        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (count == index) {
                insertView.frame = CGRectMake(width * count, 0, width, height);
                [self addSubview:insertView];
                count ++;
            }
            obj.frame = CGRectMake(width * count, 0, width, height);
            count ++;
        }
    }];
    
}

@end
