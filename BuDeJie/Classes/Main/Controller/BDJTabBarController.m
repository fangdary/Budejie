//
//  BDJTabBarController.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/27/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJTabBarController.h"

#import "BDJTabBar.h"

#import "BDJNavigationController.h"

#import "BDJEssenceController.h"
#import "BDJNewestController.h"
#import "BDJFriendTrendController.h"
#import "BDJMeController.h"

#import "UITabBar+InsetItem.h"
#import "UIBarButtonItem+BarButtonItemWithButton.h"

@implementation BDJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTabBarItemTitleAttributes];
    
    [self setup];
}

#pragma mark - setup

- (void)setup {
    BDJEssenceController *essenceController = [[BDJEssenceController alloc]init];
    [self addViewController:essenceController withTitle:@"精华"
            tabBarItemImage:[[UIImage imageNamed:@"tabBar_essence_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
              selectedImage:[[UIImage imageNamed:@"tabBar_essence_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    BDJNewestController *newestController = [[BDJNewestController alloc]init];
    [self addViewController:newestController withTitle:@"最新"
            tabBarItemImage:[[UIImage imageNamed:@"tabBar_new_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
              selectedImage:[[UIImage imageNamed:@"tabBar_new_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    BDJFriendTrendController *friendTrendController = [[BDJFriendTrendController alloc]init];
    [self addViewController:friendTrendController withTitle:@"关注"
            tabBarItemImage:[[UIImage imageNamed:@"tabBar_friendTrends_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
              selectedImage:[[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    BDJMeController *meController = [[BDJMeController alloc]init];
    [self addViewController:meController withTitle:@"我的"
            tabBarItemImage:[[UIImage imageNamed:@"tabBar_me_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
              selectedImage:[[UIImage imageNamed:@"tabBar_me_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    BDJTabBar *tabBar = [[BDJTabBar alloc]init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
}

//添加子控制器(自定义导航控制器)
- (void)addViewController:(UIViewController *)childController withTitle:(NSString *)title tabBarItemImage:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    
    childController.title = title;
    
    //添加子控制器
    BDJNavigationController *navigationController = [[BDJNavigationController alloc]initWithRootViewController:childController];
    
    navigationController.tabBarItem = [[UITabBarItem  alloc]initWithTitle:title image:image selectedImage:selectedImage];
    
    [self addChildViewController:navigationController];
}

//设置TabBarItem文字样式
- (void)setTabBarItemTitleAttributes {
    UITabBarItem *item = [UITabBarItem appearance];
    
    //设置未选中item的title样式
    NSMutableDictionary *normalAttribute = [NSMutableDictionary dictionary];
    normalAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    normalAttribute[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    
    //设置选中item的title样式
    NSMutableDictionary *selectedAttribute = [NSMutableDictionary dictionary];
    selectedAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttribute[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttribute forState:UIControlStateNormal];
}


@end
