//
//  ViewController.m
//  新浪微博(简版)
//
//  Created by lihonggui on 2016/11/10.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "WeiBoModel.h"
#import "WeiBoCell.h"
@interface ViewController ()
@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    #warning 使用自动布局时,需要设置它的预估行高,否者contentLabel显示不全面
    //预估行高,默认是0,设置非0就好
    self.tableView.estimatedRowHeight = 40;
    //自动计算行高
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

-(NSArray *)dataArray
    {
    if (_dataArray == nil) {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"weibo.plist" ofType:nil];
        NSArray *temp =[NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray *mutb = [NSMutableArray array];
        
        for (NSDictionary *dict in temp) {
            WeiBoModel *weiBoModel = [WeiBoModel weiBoModelWithDict:dict];
            [mutb addObject:weiBoModel];
        }
        _dataArray = mutb;
    
    }
    return _dataArray;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu", (unsigned long)self.dataArray.count);
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"WeiBoCell";
    WeiBoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WeiBoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    WeiBoModel *weiBoModel = self.dataArray[indexPath.row];
    cell.weiBoModel = weiBoModel;
    return cell;
}

@end
