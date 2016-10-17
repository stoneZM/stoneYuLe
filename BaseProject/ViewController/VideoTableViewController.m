//
//  VideoTableViewController.m
//  BaseProject
//
//  Created by stone on 16/9/4.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "VideoTableViewController.h"
#import "VideoCell.h"
#import "VideoViewModel.h"
@interface VideoTableViewController ()
@property(nonatomic,strong) VideoViewModel *videoVM;
@end

@implementation VideoTableViewController
- (VideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM=[VideoViewModel new];
    }
    return _videoVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
        [self.tableView.header endRefreshing];
        [self.tableView reloadData];
    }];

        [self.tableView.header beginRefreshing];

    self.tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
    [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
        [self.tableView.footer endRefreshing];
        [self.tableView reloadData];
    }];
}];

}

#pragma mark - UITableView 注意是Group形式,以section区分
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
//设置section头部高度1像素， 高度最小是1
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
//设置secion脚部高度9像素
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 9;
}
//row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 720 *540
    CGFloat heigth= kWindowW * 540.0 / 720;
    return heigth;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"cell" owner:nil options:nil].firstObject;
    }
    cell.titleLb.text = [self.videoVM titleForRow:indexPath.section];
    cell.descLb.text = [self.videoVM descForRow:indexPath.section];
    [cell.iconBtn setBackgroundImageForState:0 withURL:[self.videoVM iconURLForRow:indexPath.section]];
    cell.videoURL=[self.videoVM videoURLForRow:indexPath.section];

    return cell;
}


-(void)settabBarImage{
    UIImage* norImage = [UIImage imageNamed:@"tabbar_sound_n"];
    norImage = [norImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage* selectedImage = [UIImage imageNamed:@"tabbar_sound_h"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tabBarItem setImage:norImage];
    [self.tabBarItem setSelectedImage:selectedImage];
    [self.tabBarItem setImageInsets:UIEdgeInsetsMake(5,0,-5,0)];
}
@end
