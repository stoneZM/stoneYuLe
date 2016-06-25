//
//  XMCategoryTableViewController.m
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMCategoryTableViewController.h"
#import "XMCategoryCell.h"
#import "XMCatagoryViewModel.h"
#import <UIImageView+WebCache.h>
#import "XMListViewController.h"
@interface XMCategoryTableViewController ()
@property (nonatomic,strong)UIButton* headerBt;
@property (nonatomic,strong)UIImageView* headerIV;
@property (nonatomic,strong)XMCatagoryViewModel* xmVM;
@property (nonatomic,strong)UIImageView* noDataIV;
@end
@implementation XMCategoryTableViewController

//头部的视图
-(UIButton *)headerBt{
    if (_headerBt == nil) {
        _headerBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerIV = [[UIImageView alloc]initWithFrame:self.tableView.bounds];
        _headerIV.contentMode = UIViewContentModeScaleToFill;
        [_headerBt addSubview:_headerIV];
        _headerBt.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 200);
        _headerIV.frame = _headerBt.bounds;
        [_headerBt bk_addEventHandler:^(id sender) {

            //点击付费精品按钮，跳转下一页，并将下一页网络请求的所需的categoryID传给它
            XMListViewController* vc = [[XMListViewController alloc]initWithCatagoryID:[self.xmVM IDForHeader] staEvent:[self.xmVM titleForHeader] staModule:[self.xmVM titleForHeader]];
               [self.navigationController pushViewController:vc animated:YES];

        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _headerBt;
}
-(XMCatagoryViewModel *)xmVM{
    if (_xmVM == nil) {
        _xmVM = [XMCatagoryViewModel new];
    }
    return _xmVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"听";
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = self.headerBt;
        self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.xmVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    //显示无网络连接提示
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                        hud.mode = MBProgressHUDModeCustomView;
                        hud.square = NO;
                        hud.labelText = @"没网你玩个屁啊!";
                        [hud hide:YES afterDelay:1.f];
                        [self.tableView.header endRefreshing];
                }else{
                    [self.headerIV sd_setImageWithURL:[self.xmVM URLForHeader] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
                      [self.tableView reloadData];
                }
                [self.tableView.header endRefreshing];
            }];
        }];
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%ld",self.xmVM.sectionNum);
    return self.xmVM.sectionNum;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 4) {
        return 2;
    }else{
        return 3;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[XMCategoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.leftLb.text = [self.xmVM titleForLeftButtonForSection:indexPath.section ForRow:indexPath.row];

    [cell.leftImageView sd_setImageWithURL:[self.xmVM URLForLeftButtonForSection:indexPath.section ForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"findsection_sound_bg"]];

    cell.rightLb.text = [self.xmVM titleForRightButtonForSection:indexPath.section ForRow:indexPath.row];

    [cell.rightImageView sd_setImageWithURL:[self.xmVM URLForRightButtonForSection:indexPath.section ForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"findsection_sound_bg"]];

    [cell.leftButton bk_removeEventHandlersForControlEvents:UIControlEventTouchUpInside];

    [cell.rightButton bk_removeEventHandlersForControlEvents:UIControlEventTouchUpInside];

    //点击左侧按钮，跳到另一页，并将另一页网络请求的参数传给它
    [cell.leftButton bk_addEventHandler:^(id sender) {

        XMListViewController* vc = [[XMListViewController alloc]initWithCatagoryID:[self.xmVM IDForLeftBtForSection:indexPath.section ForRow:indexPath.row] staEvent:[self.xmVM titleForLeftButtonForSection:indexPath.section ForRow:indexPath.row] staModule:[self.xmVM titleForLeftButtonForSection:indexPath.section ForRow:indexPath.row]];
            [self.navigationController pushViewController:vc animated:YES];

    } forControlEvents:UIControlEventTouchUpInside];

    //点击有侧按钮，跳到另一页，并将另一页网络请求的参数传给它
    [cell.rightButton bk_addEventHandler:^(id sender) {
        XMListViewController* vc = [[XMListViewController alloc]initWithCatagoryID:[self.xmVM IDForRightBtForSection:indexPath.section ForRow:indexPath.row] staEvent:[self.xmVM titleForRightButtonForSection:indexPath.section ForRow:indexPath.row] staModule:[self.xmVM titleForRightButtonForSection:indexPath.section ForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];


    } forControlEvents:UIControlEventTouchUpInside];

    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 35;
}





@end
