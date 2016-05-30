//
//  BDJAdController.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/26/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJAdController.h"

#import "BDJTabBarController.h"

#import "UIImageView+WebCache.h"
#import "BDJHttpSessionManager.h"
#import "MJExtension.h"
#import "BDJAdModel.h"

#define iPhone4 (kScreenHeight == 480)
#define iPhone5 (kScreenHeight == 568)
#define iPhone6 (kScreenHeight == 667)
#define iPhone6P (kScreenHeight == 736)

#define requestUrl @"http://mobads.baidu.com/cpro/ui/mads.php?code2=phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface BDJAdController ()

/**
 *  背景图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

/**
 *  跳过按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *overLookBtn;

/**
 *  广告图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;

/**
 *  定时器
 */
@property (strong, nonatomic)NSTimer *timer;


/**
 *  广告模型数组
 */
@property (strong, nonatomic)BDJAdModel *adModel;

@end

@implementation BDJAdController

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackImage];
    [self loadAdImage];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startTimer];
}

#pragma mark - Overlook Click

//点击跳过按钮,直接跳转到主界面
- (IBAction)overLookClick:(UIButton *)sender {
    //因为点击跳转后,这个控制器会被销毁,所有会话管理者不需要手动释放,反之如果有助于的情况,则需要手动释放
    [self endTimer];
    BDJTabBarController *mainController = [[BDJTabBarController alloc]init];
    [[UIApplication sharedApplication].keyWindow setRootViewController:mainController];
}

//设置占位图片
- (void)setupBackImage {
    UIImage *image = nil;
    
    //注意名称的完整性
    if (iPhone6P) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x.png"];
    }else if (iPhone6) {
        image = [UIImage imageNamed:@"LaunchImage-800-667h@2x.png"];
    }else if (iPhone5) {
        image = [UIImage imageNamed:@"LaunchImage-700-568h@2x.png"];
    }else if (iPhone4) {
        image = [UIImage imageNamed:@"LaunchImage@2x.png"];
    }
    self.backImageView.image = image;
}

#pragma mark - Timer Settings

- (void)startTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(addCount) userInfo:@"Scrolling" repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)endTimer {
    [self.timer invalidate];
}

#pragma mark - Overlook click

int count = 3;
- (void)addCount {
    NSString *title = [NSString stringWithFormat:@"跳过 (%d)秒", count];
    [self.overLookBtn setTitle:title forState:UIControlStateNormal];
    if (count == 0) {
        [self overLookClick:self.overLookBtn];
    }
    count --;
}

#pragma mark - Load Ad image

- (void)loadAdImage {
    
    NSString *baseUrlString = requestUrl;
    
    //创建一个会话管理者
    BDJHttpSessionManager *manager = [BDJHttpSessionManager shareHttpSessionManager];
    //[[BDJHttpSessionManager alloc]init];
    
    //创建请求参数字典
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"demo"] = @1;
    parameters[@"entrytype"] = @1;
    
    //发送请求
    [manager GET:baseUrlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        BDJAdModel *model = [BDJAdModel mj_objectWithKeyValues:[responseObject[@"ad"] lastObject]];
        self.adModel = model;
//     NSLog(@"%@ \n%@ \n%@ \n%@", model.ori_curl, model.w_picurl, model.width, model.height);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failed : %@", error);
    }];
}

#pragma mark - Setter adModel

- (void)setAdModel:(BDJAdModel *)adModel {
    _adModel = adModel;
    if (_adModel.width > 0) {
        //此处不完美,需要完善!
        CGFloat height = (kScreenWidth / [_adModel.width floatValue] )* [_adModel.height floatValue];
        
        self.adImageView.frame = CGRectMake(0, 0, kScreenWidth, height);
        
        [self.adImageView sd_setImageWithURL:[NSURL URLWithString:_adModel.w_picurl]];
    }
}

#pragma mark - Ad click

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: self.adModel.ori_curl]];
}

@end
