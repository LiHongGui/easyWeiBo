//
//  WeiBoFrame.h
//  easyWeiBo
//
//  Created by MichaelLi on 2016/11/2.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WeiBoModel;
@interface WeiBoFrame : NSObject
@property(nonatomic,assign) CGRect headImageFrame;

@property(nonatomic,assign) CGRect nameLabelFrame;

@property(nonatomic,assign) CGRect vipImageFrame;

@property(nonatomic,assign) CGRect contentLabelFrame;

@property(nonatomic,assign) CGRect pictureImageFrame;

@property(nonatomic,assign) CGFloat cellHeight;
@property(nonatomic,strong) WeiBoModel *weiBoModel;
@end
