//
//  BDJRegisterController.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/29/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJRegisterController.h"

#import "BDJLoginView.h"


@interface BDJRegisterController ()

@property (weak, nonatomic) IBOutlet UIView *loginView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeadingConstraint;

@end

@implementation BDJRegisterController

//注册
- (IBAction)registerClick:(UIButton *)sender {
    //结束编辑
    [self.view endEditing:YES];
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        self.loginViewLeadingConstraint.constant -= kScreenWidth;
    }else {
        self.loginViewLeadingConstraint.constant += kScreenWidth;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        //重新布局动画
        [self.view layoutIfNeeded];
    }];
    
}

//返回
- (IBAction)backClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//点击textField以外区域结束编辑
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - setup

- (void)setup {
    
    //输入 登录
    BDJLoginView *loginField = [[[NSBundle mainBundle]loadNibNamed:[BDJLoginView nibName] owner:nil options:nil] firstObject];
    loginField.centerX = self.loginView.width * 0.25;
    [self.loginView addSubview:loginField];
    
    //输入 注册
    BDJLoginView *registerField = [[[NSBundle mainBundle]loadNibNamed:[BDJLoginView nibName] owner:nil options:nil] lastObject];
    registerField.centerX = self.loginView.width * 0.75;
    [self.loginView addSubview:registerField];

}

//登录点击
- (IBAction)loginBtnClick:(UIButton *)sender {
    
    
    NSLog(@"loginRequest");

    //发送请求
    
    //获取服务器反馈
    
    //比对
    
    //登录并加载用户个人数据
}

//注册点击
- (IBAction)registerBtnClick:(UIButton *)sender {
    
    NSLog(@"registerRequest");
    
    //发送请求
    
    //获取反馈(可能有登录短信,预设账号)
    
    //切换到登录界面
    
}

@end
