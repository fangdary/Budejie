//
//  BDJNavigationController.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/26/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJNavigationController.h"

@interface BDJNavigationController ()

@end

@implementation BDJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBarItemTitleAttributes];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
                       
    }
    [super pushViewController:viewController animated:animated];
}

- (void)setTabBarItemTitleAttributes {
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置未选中item的title样式
    NSMutableDictionary *normalAttribute = [NSMutableDictionary dictionary];
    normalAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    normalAttribute[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    
    //设置选中item的title样式
    NSMutableDictionary *selectedAttribute = [NSMutableDictionary dictionary];
    selectedAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    selectedAttribute[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:selectedAttribute forState:UIControlStateNormal];
}

@end
