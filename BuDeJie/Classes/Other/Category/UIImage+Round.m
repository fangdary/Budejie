//
//  UIImage+Round.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/29/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "UIImage+Round.h"

@implementation UIImage (Round)

+ (UIImage *)roundWithImage:(UIImage *)image {
    //  开启图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //  设置一个圆形的裁剪区域(如果不是正方形就是椭圆)
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:
                          CGRectMake(0, 0, image.size.width, image.size.height)];
    //  把路径设置成裁剪区域
    [path addClip];
    //  把原始图片绘制上下文当中.
    [image drawAtPoint:CGPointZero];
    //  从上下文当中生成一张新的图片.
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //  关闭图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
