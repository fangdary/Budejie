//
//  BDJHttpSessionManager.m
//  BuDeJie
//
//  Created by Fangweiyi on 5/28/16.
//  Copyright © 2016 EvilGoose. All rights reserved.
//

#import "BDJHttpSessionManager.h"

@implementation BDJHttpSessionManager

implementationSingleton(HttpSessionManager);

/**
 *  封装了HTTPManager,要干什么事情就在这里弄了
 *  最好能直接返回一个通过网络获得的字典/数组
 */
- (instancetype)init {
    if (self = [super init]) {
        self.responseSerializer.acceptableContentTypes = [self.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    return self;
}


- (instancetype)initWithNewTypes:(NSString *)newType {
    if (self = [super init]) {
        self.responseSerializer.acceptableContentTypes = [self.responseSerializer.acceptableContentTypes setByAddingObject:newType];
    }
    return self;
}

#pragma mark -
//get 方法
- (id)getDataFrom:(NSString *)string withParaDict:(NSDictionary *)paraDict {
    __block id result = nil;
    [self GET:string parameters:paraDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        result = responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        result  = error;
    }];
    
    return result;
}

@end
