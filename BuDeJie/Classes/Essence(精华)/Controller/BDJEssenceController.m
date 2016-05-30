//
//  BDJEssenceController.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/26/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJEssenceController.h"

@interface BDJEssenceController ()

@end

@implementation BDJEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor redColor]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *test = [UIViewController new];
    [test.view setBackgroundColor:[UIColor darkGrayColor]];
    [self.navigationController pushViewController:test animated:YES];
}

@end
