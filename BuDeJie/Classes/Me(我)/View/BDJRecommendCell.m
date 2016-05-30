//
//  BDJRecommendCell.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/30/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJRecommendCell.h"
#import "BDJRecommendModel.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Round.h"

@interface BDJRecommendCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation BDJRecommendCell

#pragma mark - setter

+ (NSString *)identifier {
    return NSStringFromClass([BDJRecommendCell class]);
}

- (void)setModel:(BDJRecommendModel *)model {
    _model = model;
    
    //设置标题
    self.nameLabel.text = model.name;
    
    //设置图标
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return ;
        self.iconImage.image = [UIImage roundWithImage:image];
    }];
}

@end
