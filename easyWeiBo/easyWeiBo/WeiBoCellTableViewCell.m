//
//  WeiBoCellTableViewCell.m
//  easyWeiBo
//
//  Created by MichaelLi on 2016/11/1.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "WeiBoCellTableViewCell.h"
#import "WeiBoModel.h"
#import "WeiBoFrame.h"
@interface WeiBoCellTableViewCell()

@property(nonatomic,weak) UIImageView *headImageView;
@property(nonatomic,weak) UILabel *nameLabel;
@property(nonatomic,copy) UILabel *contentLabel;
@property(nonatomic,copy) UIImageView *pictureImageView;
@property(nonatomic,copy) UIImageView *vipImageView;
@end
@implementation WeiBoCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//重写
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化界面
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{
    #warning 不知道控件的大小,位置,因为是从网络上数据获取的--所以要先实例化
    //头像
    UIImageView *headImageView = [[UIImageView alloc]init];
    #warning 不要赋值反了
    _headImageView = headImageView;
    [self.contentView addSubview:headImageView];
    //名字
    UILabel *nameLabel = [[UILabel alloc]init];
    _nameLabel = nameLabel;
    _nameLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:nameLabel];
    //内容
    UILabel *contentLabel = [[UILabel alloc]init];
    _contentLabel = contentLabel;
     self.contentLabel.font = [UIFont systemFontOfSize:15];
    //这里只会调用一遍
    self.contentLabel.numberOfLines = 0;
    [self.contentView addSubview: contentLabel];
    //内容图片
    UIImageView *pictureImageView = [[UIImageView alloc]init];
    _pictureImageView = pictureImageView;
    [self.contentView addSubview:pictureImageView];
    //vip
    UIImageView *vipImageView = [[UIImageView alloc]init];
    _vipImageView = vipImageView;
    [self.contentView addSubview:vipImageView];
  

}

#pragma mark
#pragma mark -  重写set方法
//-(void)setWeiBoModel:(WeiBoModel *)weiBoModel
//{
//    _weiBoModel = weiBoModel;
//
//    //给控件赋值
//    self.headImageView.image = [UIImage imageNamed:weiBoModel.icon];
//    self.nameLabel.text = weiBoModel.name;
//    self.contentLabel.text = weiBoModel.text;
//    self.pictureImageView.image = [UIImage imageNamed:weiBoModel.picture];
//    self.vipImageView.image = [UIImage imageNamed:@"vip"];
//
//    /*
//     设置frame
//     */
//    //用户头像
//    CGFloat margin = 10;
//    CGFloat headIamgeViewWidth = 30;
//    CGFloat headIamgeViewHeight = headIamgeViewWidth;
//    self.headImageView.frame = CGRectMake(margin, margin, headIamgeViewWidth, headIamgeViewHeight);
//
//    //用户名字
////    CGFloat nameLabelWidth = (CGFloat )weiBoModel.name.length;
//    NSLog(@"(CGFloat )weiBoModel.name.length%f",(CGFloat )weiBoModel.name.length);
////    CGFloat nameLabelWidth = 80;
////    CGFloat nameLabelWidth = MAXFLOAT;
//
////    self.nameLabel.font = [UIFont systemFontOfSize:15];
//    CGFloat nameLabelX = margin*2 + headIamgeViewWidth;
//    //真实名字的size
//    CGSize realName = CGSizeMake(MAXFLOAT, MAXFLOAT);
//    NSDictionary *dict = @{NSFontAttributeName :[UIFont systemFontOfSize:10]};
//    CGSize realNameLabel = [weiBoModel.name boundingRectWithSize:realName options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
//    self.nameLabel.frame = CGRectMake(nameLabelX,margin, realNameLabel.width, realNameLabel.height);
//
//    //文本内容
//    CGFloat contentLabelX = margin;
//    CGFloat contentLabelY = CGRectGetMaxY(self.headImageView.frame) + margin;
//    //真实文本内容
//    CGFloat width = 355;
//    CGSize realText = CGSizeMake(width, MAXFLOAT);
//    CGSize realContentLabel =  [weiBoModel.text boundingRectWithSize:realText options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:15]} context:nil].size;
//    self.contentLabel.frame = CGRectMake(contentLabelX, contentLabelY, width,realContentLabel.height);
//
//    #warning 放着这里不好:(每次滚动cell就会调用)
////    self.contentLabel.numberOfLines = 0;
//
//    //配图
//    CGFloat  pictureImageViewX = margin;
//    CGFloat pictureImageViewY = CGRectGetMaxY(self.contentLabel.frame) + margin;
//    self.pictureImageView.frame = CGRectMake(pictureImageViewX, pictureImageViewY, headIamgeViewWidth*2, headIamgeViewWidth*2);
//    //vip
//    CGFloat vipImageViewX = CGRectGetMaxX(self.nameLabel.frame) + margin;
//    self.vipImageView.frame = CGRectMake(vipImageViewX, margin, 10, 10);
//    
//    /*
//     设置rowHeight
//     */
//    CGFloat realRowHeight =0;
//    //判断---
//    if (weiBoModel.picture) {//有配图
//        //设置picture.frame
//        _pictureImageView.frame = CGRectMake(margin, pictureImageViewY, headIamgeViewWidth*2, headIamgeViewWidth*2);
//        realRowHeight = CGRectGetMaxY(_pictureImageView.frame) + margin;
//    }else {
//        _pictureImageView.frame = CGRectZero;
//        realRowHeight = CGRectGetMaxY(_contentLabel.frame) + margin;
//    }
//}

#pragma mark
#pragma mark -  重写WeiBoFrame
-(void)setWeiBoFrame:(WeiBoFrame *)weiBoFrame
{
    _weiBoFrame = weiBoFrame;
    //设置数据
    [self setupData];
    //设置frame
    [self stupFrame];

#warning 设置frame,应该在WeiBoFrame中
//    /*
//     设置frame
//     */
//    //用户头像
//    CGFloat margin = 10;
//    CGFloat headIamgeViewWidth = 30;
//    CGFloat headIamgeViewHeight = headIamgeViewWidth;
//    self.headImageView.frame = CGRectMake(margin, margin, headIamgeViewWidth, headIamgeViewHeight);
//
//    //用户名字
//    //    CGFloat nameLabelWidth = (CGFloat )weiBoModel.name.length;
//    NSLog(@"(CGFloat )weiBoModel.name.length%f",(CGFloat )weiBoModel.name.length);
//    //    CGFloat nameLabelWidth = 80;
//    //    CGFloat nameLabelWidth = MAXFLOAT;
//
//    //    self.nameLabel.font = [UIFont systemFontOfSize:15];
//    CGFloat nameLabelX = margin*2 + headIamgeViewWidth;
//    //真实名字的size
//    CGSize realName = CGSizeMake(MAXFLOAT, MAXFLOAT);
//    NSDictionary *dict = @{NSFontAttributeName :[UIFont systemFontOfSize:10]};
//    CGSize realNameLabel = [weiBoModel.name boundingRectWithSize:realName options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
//    self.nameLabel.frame = CGRectMake(nameLabelX,margin, realNameLabel.width, realNameLabel.height);
//
//    //文本内容
//    CGFloat contentLabelX = margin;
//    CGFloat contentLabelY = CGRectGetMaxY(self.headImageView.frame) + margin;
//    //真实文本内容
//    CGFloat width = 355;
//    CGSize realText = CGSizeMake(width, MAXFLOAT);
//    CGSize realContentLabel =  [weiBoModel.text boundingRectWithSize:realText options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:15]} context:nil].size;
//    self.contentLabel.frame = CGRectMake(contentLabelX, contentLabelY, width,realContentLabel.height);
//
//#warning 放着这里不好:(每次滚动cell就会调用)
//    //    self.contentLabel.numberOfLines = 0;
//
//    //配图
//    CGFloat  pictureImageViewX = margin;
//    CGFloat pictureImageViewY = CGRectGetMaxY(self.contentLabel.frame) + margin;
//    self.pictureImageView.frame = CGRectMake(pictureImageViewX, pictureImageViewY, headIamgeViewWidth*2, headIamgeViewWidth*2);
//    //vip
//    CGFloat vipImageViewX = CGRectGetMaxX(self.nameLabel.frame) + margin;
//    self.vipImageView.frame = CGRectMake(vipImageViewX, margin, 10, 10);
//
//    /*
//     设置rowHeight
//     */
//    CGFloat realRowHeight =0;
//    //判断---
//    if (weiBoModel.picture) {//有配图
//        //设置picture.frame
//        _pictureImageView.frame = CGRectMake(margin, pictureImageViewY, headIamgeViewWidth*2, headIamgeViewWidth*2);
//        realRowHeight = CGRectGetMaxY(_pictureImageView.frame) + margin;
//    }else {
//        _pictureImageView.frame = CGRectZero;
//        realRowHeight = CGRectGetMaxY(_contentLabel.frame) + margin;
//    }
}

-(void)setupData
{
    //取出Model里面的数据
    WeiBoModel *weiBoModel = _weiBoFrame.weiBoModel;
    //给控件赋值
    self.headImageView.image = [UIImage imageNamed:weiBoModel.icon];
    self.nameLabel.text = weiBoModel.name;
    if (weiBoModel.vip ==1) {
        self.nameLabel.textColor = [UIColor redColor];
    }else {
        self.nameLabel.textColor = [UIColor blackColor];
    }
    self.contentLabel.text = weiBoModel.text;
    self.pictureImageView.image = [UIImage imageNamed:weiBoModel.picture];
    self.vipImageView.image = [UIImage imageNamed:@"vip"];
}

-(void)stupFrame
{
    self.headImageView.frame = _weiBoFrame.headImageFrame;
    self.nameLabel.frame = _weiBoFrame.nameLabelFrame;
    self.vipImageView.frame = _weiBoFrame.vipImageFrame;
    self.contentLabel.frame = _weiBoFrame.contentLabelFrame;
    self.pictureImageView.frame = _weiBoFrame.pictureImageFrame;
}
@end
