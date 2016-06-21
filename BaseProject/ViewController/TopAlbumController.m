//
//  TopAlbumController.m
//  BaseProject
//
//  Created by stone on 16/6/19.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TopAlbumController.h"
#import "XMTopAlbumViewModel.h"
#import "TopAlbumListCell.h"
#import "XMAlbumDetailViewController.h"
@interface TopAlbumController ()
@property (nonatomic,strong)XMTopAlbumViewModel* xmVM;
@end

@implementation TopAlbumController

-(XMTopAlbumViewModel *)xmVM{
    if (_xmVM == nil) {
        _xmVM = [[XMTopAlbumViewModel alloc]initWithKey:self.key statEven:self.statEven statPage:self.statPage];
    }
    return _xmVM;
}

-(instancetype)initWithKey:(NSString *)key statEven:(NSString *)statEven statPage:(NSString *)statPage{
    if(self = [super init]){
        self.key = key;
        self.statEven = statEven;
        self.statPage = statPage;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.xmVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.xmVM getMoreDataCompletionHandle:^(NSError *error) {
            if (self.xmVM.pageId == self.xmVM.maxPage) {
                [self.tableView.footer endRefreshingWithNoMoreData];
            }else{
                [self.tableView.footer endRefreshing];
            }
            [self.tableView reloadData];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.xmVM.rowNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   TopAlbumListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"TopAlbumListCell" owner:nil options:nil].firstObject;
    }
    //调用下面的方法，改变前3行的字体颜色
    [self setColorRorFirstThreeRow:indexPath.row sender:cell];
    cell.rowNumLb.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.titleLb.text = [self.xmVM getTitleForRow:indexPath.row];
    cell.nickNameLb.text = [self.xmVM getNickNameForRow:indexPath.row];
    cell.tracksLb.text = [self.xmVM getTracksForRow:indexPath.row];
    [cell.coverIV sd_setImageWithURL:[self.xmVM getUrlForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
    cell.selectedBackgroundView = [[UIView alloc]init];
    cell.selectedBackgroundView.backgroundColor = kRGBColor(250, 255, 254);
    return cell;
}
-(void)setColorRorFirstThreeRow:(NSInteger)row sender:(TopAlbumListCell*)cell{
    if (row == 0) {
        cell.rowNumLb.textColor = [UIColor redColor];
    }else if(row == 1){
        cell.rowNumLb.textColor = [UIColor greenColor];
    }else if(row == 2){
        cell.rowNumLb.textColor = [UIColor blueColor];
    }

}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XMAlbumDetailViewController* vc = [[XMAlbumDetailViewController alloc]initWithAlbumID:[[self.xmVM getAlbumIdForRow:indexPath.row] integerValue] position:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];

}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsMake(0,25, 0, 0);
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}
@end
