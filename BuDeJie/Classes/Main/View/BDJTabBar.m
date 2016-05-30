//
//  BDJTabBar.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/26/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJTabBar.h"

#import "UITabBar+InsetItem.h"

@interface BDJTabBar ()

@end

@implementation BDJTabBar

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.tintColor = [UIColor redColor];
    
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [centerButton setImage:[[UIImage imageNamed:@"tabBar_publish_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [centerButton setImage:[[UIImage imageNamed:@"tabBar_publish_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateHighlighted];
    
    [centerButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self tabBarInsertView:centerButton atIndex:2];
}

- (void)click:(UIButton *)sender {
    NSLog(@"%s", __func__);
}


//设置TabBarItem文字样式
- (void)setTabBarItemTitleAttributes {
    UITabBarItem *item = [UITabBarItem appearance];
    
    NSMutableDictionary *attriDict = [NSMutableDictionary dictionary];
    
    attriDict[@"NSFontAttributeName"] = [UIFont systemFontOfSize:13];
    attriDict[@"NSForegroundColorAttributeName"] = [UIColor greenColor];
    [item setTitleTextAttributes:attriDict forState:UIControlStateNormal];
}

@end
