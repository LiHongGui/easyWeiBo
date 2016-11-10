//
//  WeiBoCell.m
//  新浪微博(简版)
//
//  Created by lihonggui on 2016/11/10.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "WeiBoCell.h"
#import "WeiBoModel.h"
@implementation WeiBoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setWeiBoModel:(WeiBoModel *)weiBoModel
{
    _weiBoModel = weiBoModel;
    
    _iconImageView.image = [UIImage imageNamed:weiBoModel.icon];
    _nameLabel.text = weiBoModel.name;
    _vipImageView.image = [UIImage imageNamed:@"vip"];
    _vipImageView.hidden = !weiBoModel.isVip;
    if (weiBoModel.vip) {
        
        [_nameLabel setTextColor:[UIColor redColor]];
    }else
    {
         [_nameLabel setTextColor:[UIColor blackColor]];
    }
    _contentLabel.text = weiBoModel.text;
    //有无配图---model里面的picture有值
    if (_weiBoModel.picture) {
        _pictureImageView.image = [UIImage imageNamed:weiBoModel.picture];
       _pictureWidth.constant = 120;
       _pictureHeight.constant = 120;
    }else
    {
        _pictureWidth.constant = 0;
        _pictureHeight.constant = 0;
        _pictureTop.constant = 0;
        
    }
}
@end
