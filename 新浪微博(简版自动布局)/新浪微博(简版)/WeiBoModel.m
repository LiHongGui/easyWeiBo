//
//  WeiBoModel.m
//  新浪微博(简版)
//
//  Created by lihonggui on 2016/11/10.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "WeiBoModel.h"

@implementation WeiBoModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)weiBoModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
