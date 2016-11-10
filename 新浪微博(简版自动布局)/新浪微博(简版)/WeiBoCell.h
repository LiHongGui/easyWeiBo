//
//  WeiBoCell.h
//  新浪微博(简版)
//
//  Created by lihonggui on 2016/11/10.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiBoModel;
@interface WeiBoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
//自动布局配图的宽高
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureTop;


@property(nonatomic,strong) WeiBoModel *weiBoModel;
@end
