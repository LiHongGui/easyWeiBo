//
//  WeiBoModel.h
//  easyWeiBo
//
//  Created by MichaelLi on 2016/11/1.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiBoModel : NSObject
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *picture;

@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) NSInteger vip;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)weiBoModelWithDcit:(NSDictionary *)dict;




@end
