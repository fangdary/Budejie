//
//  UIBarButtonItem+BarButtonItemWithButton.m
//  ComprehensiveSample_0420_Exercise
//
//  Created by Fangweiyi on 4/20/16.
//  Copyright © 2016 Fangweiyi. All rights reserved.
//

#import "UIBarButtonItem+BarButtonItemWithButton.h"

@implementation UIBarButtonItem (BarButtonItemWithButton)
+ (UIBarButtonItem *)barButtonItemWithCustomImageName:(NSString *)customImageName hightlightedImage:(NSString *)hightlightedImageName forTarget:(id)target WithAction:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    [button setImage:[UIImage imageNamed:customImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightlightedImageName] forState:UIControlStateHighlighted];
    
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    return  buttonItem;
}

+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)customImage hightlightedImage:(UIImage *)hightlightedImage forTarget:(id)target WithAction:(SEL)action  {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    //调试颜色
//    [button setBackgroundColor:[UIColor redColor]];
    
    [button setImage:customImage forState:UIControlStateNormal];
    [button setImage:hightlightedImage forState:UIControlStateHighlighted];
    
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return  buttonItem;
}
@end
