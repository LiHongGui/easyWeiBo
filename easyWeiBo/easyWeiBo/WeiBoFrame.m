//
//  WeiBoFrame.m
//  easyWeiBo
//
//  Created by MichaelLi on 2016/11/2.
//  Copyright © 2016年 手持POS机. All rights reserved.
//
#import "WeiBoFrame.h"
#import "WeiBoModel.h"
#warning 专门负责设置WeiBo的Frame

@implementation WeiBoFrame

//重写set方法
-(void)setWeiBoModel:(WeiBoModel *)weiBoModel
{
    _weiBoModel = weiBoModel;


    //计算所有空间frame的值
    /*
     设置frame
     */
    //用户头像
    CGFloat margin = 10;
    CGFloat headIamgeViewWidth = 35;
    CGFloat headIamgeViewHeight = headIamgeViewWidth;
    _headImageFrame = CGRectMake(margin, margin, headIamgeViewWidth, headIamgeViewHeight);

    //用户名字
    //    CGFloat nameLabelWidth = (CGFloat )weiBoModel.name.length;
    //    CGFloat nameLabelWidth = 80;
    //    CGFloat nameLabelWidth = MAXFLOAT;

    //    self.nameLabel.font = [UIFont systemFontOfSize:15];
    CGFloat nameLabelX = margin*2 + headIamgeViewWidth;
    //真实名字的size
    CGSize realName = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSDictionary *dict = @{NSFontAttributeName :[UIFont systemFontOfSize:10]};
    CGSize realNameLabel = [weiBoModel.name boundingRectWithSize:realName options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    _nameLabelFrame= CGRectMake(nameLabelX,margin, realNameLabel.width, realNameLabel.height);

    //文本内容
    CGFloat contentLabelX = margin;
    CGFloat contentLabelY = CGRectGetMaxY(_headImageFrame) + margin;
    //真实文本内容
    CGFloat width = 355;
    CGSize realText = CGSizeMake(width, MAXFLOAT);
    CGSize realContentLabel =  [weiBoModel.text boundingRectWithSize:realText options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:15]} context:nil].size;
    _contentLabelFrame = CGRectMake(contentLabelX, contentLabelY, width,realContentLabel.height);

#warning 放着这里不好:(每次滚动cell就会调用)
    //    self.contentLabel.numberOfLines = 0;

    //配图
    CGFloat  pictureImageViewX = margin;
    CGFloat pictureImageViewY = CGRectGetMaxY(_contentLabelFrame) + margin;
    _pictureImageFrame = CGRectMake(pictureImageViewX, pictureImageViewY, headIamgeViewWidth*3, headIamgeViewWidth*3);
    NSLog(@"headIamgeViewWidth6%f",headIamgeViewWidth*6);
    //vip
    if (weiBoModel.vip == 1) {

        CGFloat vipImageViewX = CGRectGetMaxX(_nameLabelFrame) + margin;
        _vipImageFrame = CGRectMake(vipImageViewX, margin, 10, 10);
    } else {
        _vipImageFrame = CGRectZero;
    }

    /*
     设置rowHeight
     */
    //判断---
    if (weiBoModel.picture) {//有配图
        //设置picture.frame
        _pictureImageFrame = CGRectMake(margin, pictureImageViewY, headIamgeViewWidth*2, headIamgeViewWidth*2);
        _cellHeight = CGRectGetMaxY(_pictureImageFrame) + margin;
    }else {
        _pictureImageFrame = CGRectZero;
        _cellHeight = CGRectGetMaxY(_contentLabelFrame) + margin;
    }

}

@end
