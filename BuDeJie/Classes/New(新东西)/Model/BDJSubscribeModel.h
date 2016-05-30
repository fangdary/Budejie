//
//  BDJSubscribeModel.h
//  BuDeJie
//
//  Created by Fangweiyi on 5/29/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 is_sub 	int 	是否含有子标签
 theme_id 	string 	此标签的id
 theme_name 	string 	标签名称
 sub_number 	string 	此标签的订阅量
 is_default 	int 	是否是默认的推荐标签
 image_list 	string 	推荐标签的图片url地址
 */

@interface BDJSubscribeModel : NSObject

/**订阅数量*/
@property (copy, nonatomic)NSString *sub_number;

/**头像url*/
@property (copy, nonatomic)NSString *image_list;

/**名称*/
@property (copy, nonatomic)NSString *theme_name;

@end
