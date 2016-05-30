//
//  BDJMeController.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/26/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJMeController.h"

#import "BDJRecommendModel.h"
#import "BDJRecommendCell.h"

#import "BDJSettingController.h"

#import "UIBarButtonItem+BarButtonItemWithButton.h"

#import "BDJHttpSessionManager.h"

#import "MJExtension.h"

#define URLStr @"http://api.budejie.com/api/api_open.php"

@interface BDJMeController () <
                UITableViewDataSource,
                UITableViewDelegate,
                UICollectionViewDataSource,
                UICollectionViewDelegate >

/**推荐模型数组*/
@property (strong, nonatomic)NSArray *recommendArray;

@end

static NSString *const MineID= @"mineCell";

@implementation BDJMeController

/**name icon
 *  lazyload
 */

- (NSArray *)recommendArray {
    if (!_recommendArray) {
        NSArray *array = [NSArray array];
        _recommendArray = array;
    }
    return _recommendArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    [self loadData];
    [self addFooterView];
}

//加载数据
- (void)loadData {
    BDJHttpSessionManager *manager = [BDJHttpSessionManager shareHttpSessionManager];
    
    NSDictionary *parameters = @{
                                 @"a" : @"square",
                                 @"c" : @"topic"
                                 };
    
    [manager GET:URLStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject) {
        
        NSMutableArray *temp = [NSMutableArray array];
        
        temp = [BDJRecommendModel mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
        
        self.recommendArray = [NSArray arrayWithArray:temp];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}

#pragma mark - setup 

- (void)setup {
    //设置导航栏内容
    UIBarButtonItem *settingItem = [UIBarButtonItem barButtonItemWithCustomImage:[UIImage imageNamed:@"mine-setting-icon"] hightlightedImage:[UIImage imageNamed:@"mine-setting-icon-click"] forTarget:self WithAction:@selector(settingClick)];
    UIBarButtonItem *visionChange = [UIBarButtonItem barButtonItemWithCustomImage:[UIImage imageNamed:@"mine-moon-icon"] hightlightedImage:[UIImage imageNamed:@"mine-moon-icon-click"] forTarget:self WithAction:@selector(changeVision)];
    
    self.navigationItem.rightBarButtonItems = @[ settingItem, visionChange ];
    
}

- (void)settingClick {
    BDJSettingController *settingController = [[BDJSettingController alloc]init];
    
    [self.navigationController pushViewController:settingController animated:YES];
}


- (void)addFooterView {
    //流式布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;
    layout.itemSize = CGSizeMake(70, 70);
    
    UICollectionView *recommendSquares = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 300) collectionViewLayout:layout];
    
    recommendSquares.dataSource = self;
    
    [recommendSquares registerClass:[BDJRecommendCell class] forCellWithReuseIdentifier:[BDJRecommendCell identifier]];
    
    self.tableView.tableFooterView = recommendSquares;
}

//改变显示的模式
- (void)changeVision {
    //如果是白天,修改色温
    
    //如果是晚间,改为夜间模式
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MineID];
        
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MineID];
        }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
    }else {
        cell.textLabel.text = @"离线下载";
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

#pragma mark - Collection view data souece


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.recommendArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BDJRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[BDJRecommendCell identifier] forIndexPath:indexPath];
    //加载数据
    cell.model = self.recommendArray[indexPath.item];
    
    return cell;
}

@end
