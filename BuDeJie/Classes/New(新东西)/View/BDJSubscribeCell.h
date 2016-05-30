//
//  BDJSubscribeCell.h
//  BuDeJie
//
//  Created by Fangweiyi on 5/29/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDJSubscribeModel;
@interface BDJSubscribeCell : UITableViewCell

/**模型*/
@property (strong, nonatomic)BDJSubscribeModel *model;

+ (NSString *)identifier;

@end
