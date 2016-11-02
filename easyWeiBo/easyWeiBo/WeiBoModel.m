
//  WeiBoModel.m
//  easyWeiBo
//
//  Created by MichaelLi on 2016/11/1.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "WeiBoModel.h"

@implementation WeiBoModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)weiBoModelWithDcit:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
