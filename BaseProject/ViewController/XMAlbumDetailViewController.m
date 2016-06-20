//
//  XMAlbumDetailViewController.m
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMAlbumDetailViewController.h"
#import "AlbumListCell.h"
#import "AlbumPlayController.h"
@interface XMAlbumDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)AMAlbumDatailViewModel* xmVM;
@property (nonatomic,strong)UITableView* tableView;
@end

@implementation XMAlbumDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.xmVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.xmVM getMoreDataCompletionHandle:^(NSError *error) {
            if (self.xmVM.pageID == self.xmVM.maxPageId) {
                [self.tableView.footer endRefreshingWithNoMoreData];
            }else{
                [self.tableView.footer endRefreshing];
            }
            [self.tableView reloadData];
        }];
    } ];

    [self.tableView.header beginRefreshing];
}

-(instancetype)initWithAlbumID:(NSInteger)albumID position:(NSInteger)position{
    if (self = [super init]) {
        self.albumID = albumID;
        self.position = position;
    }
    return self;
}

-(AMAlbumDatailViewModel *)xmVM{
    if (_xmVM == nil) {
        _xmVM = [[AMAlbumDatailViewModel alloc]initWithAlbumID:self.albumID statPage:nil position:self.position];
    }
    return _xmVM;
}
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.estimatedRowHeight = 100; //给一个行高的估计值，然后大小才可以伸缩变化
        //设置代理
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.xmVM.rowNum;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AlbumListCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"AlbumListCell" owner:nil options:nil].firstObject;
    }
    cell.titleLb.text = [self.xmVM titleForRow:indexPath.row];
    [cell.coverIV sd_setImageWithURL:[self.xmVM urlForcoverForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
    cell.playCountsLb.text = [self.xmVM playtimesRorRow:indexPath.row];
    cell.durationLb.text = [self.xmVM durationForRow:indexPath.row];
    cell.commmentLb.text = [self.xmVM commentdForRow:indexPath.row];
    cell.updatetimeLb.text = [self.xmVM updatetimeForRow:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeadrInSection:(NSInteger)section{
    return 1;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    AlbumPlayController* vc1 = [AlbumPlayController defaultWithPlayUrl:[self.xmVM mp3URLForRow:indexPath.row]];
    [self.navigationController pushViewController:vc1 animated:YES];
}


@end
