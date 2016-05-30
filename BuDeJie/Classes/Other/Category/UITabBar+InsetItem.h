//
//  UITabBar+InsetItem.h
//  BuDeJie
//
//  Created by Fangweiyi on 5/26/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (InsetItem)


/**
 *  在某个位置插入一个控件
 *
 *  @param insertView 位置
 *  @param index      控件
 *
 */
- (void )tabBarInsertView:(UIView *)insertView atIndex:(NSInteger)index;

@end
