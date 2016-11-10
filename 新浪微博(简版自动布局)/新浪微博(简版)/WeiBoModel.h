//
//  WeiBoModel.h
//  新浪微博(简版)
//
//  Created by lihonggui on 2016/11/10.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiBoModel : NSObject
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign,getter=isVip) BOOL vip;
@property(nonatomic,copy) NSString *picture;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)weiBoModelWithDict:(NSDictionary *)dict;
@end
