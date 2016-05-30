//
//  BDJsubscribeController.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/29/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJsubscribeController.h"

#import "BDJSubscribeModel.h"
#import "BDJSubscribeCell.h"

#import "MJExtension.h"

#define URLStr @"http://api.budejie.com/api/api_open.php"

@interface BDJsubscribeController ()

/**
 * 模型数组
 */
@property (strong, nonatomic)NSArray *subscribeArray;

@end

@implementation BDJsubscribeController

#pragma mark - Life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - Setup

- (void)setup {
    [self loadData];
}

//加载数据
- (void)loadData {
    BDJHttpSessionManager *manager = [BDJHttpSessionManager shareHttpSessionManager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    
    [manager GET:URLStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
        
#warning 这个方法返回的是一个数组,不是单个模型
        self.subscribeArray = [BDJSubscribeModel mj_objectArrayWithKeyValuesArray:responseObject];
        
        //加载数据
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error %@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.subscribeArray count];
}


- (BDJSubscribeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BDJSubscribeCell *cell = [tableView dequeueReusableCellWithIdentifier:[BDJSubscribeCell identifier]];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:[BDJSubscribeCell identifier] owner:nil options:nil] firstObject];
    }
    
    
    //设置数据
    cell.model = self.subscribeArray[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate 

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}


@end