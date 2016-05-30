//
//  BDJSubscribeCell.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/29/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJSubscribeCell.h"

#import "BDJSubscribeModel.h"

#import "UIImageView+WebCache.h"
#import "UIImage+Round.h"

@interface BDJSubscribeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subscribeLabel;

@end

@implementation BDJSubscribeCell

//返回cell的唯一标识

+ (NSString *)identifier {
    return NSStringFromClass([BDJSubscribeCell class]);
}

#pragma mark - setter

- (void)setModel:(BDJSubscribeModel *)model {
    _model = model;
    self.nameLabel.text = [NSString stringWithFormat:@"%@", model.theme_name];
    self.subscribeLabel.text = model.sub_number;
    
    //方法1
    /*
    self.iconImage.layer.cornerRadius = self.iconImage.width * 0.5;
    self.iconImage.layer.masksToBounds = YES;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    */
    
    
    //方法2
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //如果没有加载成功图片,直接使用展位图片即可
        if (image == nil) return ;
        //画圆形头像
        self.iconImage.image =[UIImage roundWithImage:image];
    }];
}

#pragma mark - 

- (void)layoutSubviews {
    [super layoutSubviews];
    self.y -= 1;
    
    //方案1
    /*
    UIView *seperateLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 1)];
    [seperateLine setBackgroundColor:[UIColor darkGrayColor]];
    [self addSubview:seperateLine];
    */
    //方案2
//    NSLog(@"%f", self.separatorInset.left);
    self.separatorInset = UIEdgeInsetsMake(0, -10, 0, 0);
    self.tintColor = [UIColor redColor];
}


@end
