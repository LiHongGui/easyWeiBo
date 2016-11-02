//
//  WeiBoCellTableViewCell.h
//  easyWeiBo
//
//  Created by MichaelLi on 2016/11/1.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiBoFrame;
//@class WeiBoModel;

@interface WeiBoCellTableViewCell : UITableViewCell

//@property(nonatomic,strong) WeiBoModel *weiBoModel;
@property(nonatomic,strong) WeiBoFrame *weiBoFrame;
@end
