//
//  BDJAdModel.h
//  BuDeJie
//
//  Created by Fangweiyi on 5/28/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDJAdModel : NSObject

//ori_curl 点击后跳转
//w_picurl  图片url
//h 图片高度
//w 图片宽度

/**ori_curl*/
@property (copy, nonatomic)NSString *ori_curl;

/**w_picurl*/
@property (copy, nonatomic)NSString *w_picurl;

/**宽度*/
@property (assign, nonatomic)NSNumber *width;

/**高度*/
@property (assign, nonatomic)NSNumber *height;

@end
