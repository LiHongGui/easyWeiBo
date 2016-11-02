//
//  ViewController.m
//  easyWeiBo
//
//  Created by MichaelLi on 2016/11/1.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "ViewController.h"
#import "WeiBoModel.h"
#import "WeiBoCellTableViewCell.h"
#import "WeiBoFrame.h"
@interface ViewController ()

@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置cell的高度---这里就不需要设置row的高度了
//    self.tableView.rowHeight = 400;

}
#pragma mark
#pragma mark -  懒加载
-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"weibo.plist" ofType:nil];
        NSArray *temp = [NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray *mutb = [NSMutableArray array];
        for (NSDictionary *dict in temp) {
            WeiBoModel *model = [WeiBoModel weiBoModelWithDcit:dict];

            //在这里设置(只会运行一次)把WeiBoModel赋值给WeiBoFrame(计算所有的空间frame和cell高度)
            WeiBoFrame *weiBoFrame = [[WeiBoFrame alloc]init];
            weiBoFrame.weiBoModel = model;
            [mutb addObject:weiBoFrame];
        }
        _dataArray = mutb;
    }
    return _dataArray;
}
#pragma mark
#pragma mark - 组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark
#pragma mark -  行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

#pragma mark
#pragma mark -  内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *identifier = @"WeiBoCellTableViewCell";
//    WeiBoCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell  == nil) {
//        cell = [[WeiBoCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    WeiBoModel *weiBoModel = self.dataArray[indexPath.row];
//    cell.weiBoModel = weiBoModel;
//    NSLog(@"numberOfRowsInSection");
//    return cell;

    static NSString *identifier = @"WeiBoCellTableViewCell";
    WeiBoCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell  == nil) {
        cell = [[WeiBoCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    WeiBoFrame *weiBoFrame = self.dataArray[indexPath.row];
    cell.weiBoFrame = weiBoFrame;
    NSLog(@"numberOfRowsInSection");
    return cell;

}
#pragma mark
#pragma mark -  设置row的高度--再设置一个类来专门负责
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   //通过打印可知:系统会先调用这个代码(cell要先知道row的高度,然后才能决定是否滚动).当滚定时(先决定内容,然后再吃确认row的高度)
    NSLog(@"heightForRowAtIndexPath");
    WeiBoFrame *weiBoFrame = self.dataArray[indexPath.row];

    return weiBoFrame.cellHeight;
}

@end
