//
//  BDJFriendTrendController.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/26/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJFriendTrendController.h"

//未登录时展示: 要求用户登录的View
#import "BDJCommandRegisterView.h"

//已经登录后: 展示用户关注界面
#import "BDJUserFollowedViewController.h"

//注册界面
#import "BDJRegisterController.h"

@interface BDJFriendTrendController ()

@property (weak, nonatomic)UIView*loginView;

@end

@implementation BDJFriendTrendController

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - Setup

- (void)setup {
    //判断登录状态,加载不同的View
    
    if (isLogined) {
        
        //已经登录
        BDJUserFollowedViewController *followedController = [[BDJUserFollowedViewController alloc]init];
        [self.view addSubview:followedController.view];
        [self addChildViewController:followedController];
        
    }else {
        
        //没有登录
        BDJCommandRegisterView *commentView = [[[NSBundle mainBundle]loadNibNamed:[BDJCommandRegisterView nibName] owner:nil options:nil] lastObject];
        commentView.frame = self.view.bounds;
        [self.view addSubview:commentView];
        
    }
    
}

//点击 "登录/注册" 按钮
- (IBAction)registerClick:(id)sender{
    BDJRegisterController *registerController = [[BDJRegisterController alloc]init];
    
    [self presentViewController:registerController animated:YES completion:nil];
}

@end
