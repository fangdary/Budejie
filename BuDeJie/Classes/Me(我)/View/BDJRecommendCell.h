//
//  BDJRecommendCell.h
//  BuDeJie
//
//  Created by Fangweiyi on 5/30/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDJRecommendModel;
@interface BDJRecommendCell : UICollectionViewCell

/**model*/
@property (strong, nonatomic)BDJRecommendModel *model;

+ (NSString *)identifier;

@end
