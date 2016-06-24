//
//  XMAlbumVIewControllerViewController.m
//  BaseProject
//
//  Created by stone on 16/6/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMAlbumVIewControllerViewController.h"
#import "XMAlbumViewModel.h"
#import "XMListViewModel.h"
#import "XMListCell.h"
#import "XMAlbumDetailViewController.h"
#import "XMTopAlbumModel.h"
@interface XMAlbumVIewControllerViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)XMAlbumViewModel* xmVM;
@property (nonatomic,strong)UITableView* tableView;
@property (nonatomic,assign)NSInteger categoryID;
@property (nonatomic,assign)NSInteger keywordsID;


@end

@implementation XMAlbumVIewControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.xmVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                //显示无网络连接提示
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                hud.mode = MBProgressHUDModeCustomView;
                hud.square = NO;
                hud.labelText = @"没网你玩个屁啊!";
                [hud hide:YES afterDelay:1.f];
                [self.tableView.header endRefreshing];
            }
            else{
                [self.tableView.header endRefreshing];
                [self.tableView reloadData];
            }
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.xmVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                hud.mode = MBProgressHUDModeCustomView;
                hud.square = NO;
                hud.labelText = @"没网你玩个屁啊!";
                [hud hide:YES afterDelay:1.f];
                [self.tableView.footer endRefreshing];
                return;
            }
            if (self.xmVM.pageId == self.xmVM.maxPageId) {
                [self.tableView.footer endRefreshingWithNoMoreData];
            }else{
                [self.tableView.footer endRefreshing];
            }
            [self.tableView reloadData];

        }];
    }];
    [self.tableView.header beginRefreshing];
}
-(NSMutableDictionary *)IDdic{
    if (_IDdic == nil) {
        _IDdic = [NSMutableDictionary new];
    }
    return _IDdic;
}

-(XMAlbumViewModel *)xmVM{
    if (_xmVM == nil) {
        self.categoryID = [self.IDdic[@"categoryID"] intValue];
        self.keywordsID = [self.IDdic[@"keywords"] intValue];
        _xmVM = [[XMAlbumViewModel alloc]initWithCatagoruId:self.categoryID KeywordID:self.keywordsID];
    }
    return _xmVM;
}

-(instancetype)initWithIDDic:(NSDictionary *)dic{
    if (self = [super init]) {
        self.IDdic = [dic mutableCopy];
    }
    return self;
}

//对tableView的懒加载
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.estimatedRowHeight = 80; //给一个行高的估计值，然后大小才可以伸缩变化
        //设置代理
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.xmVM.rowNum;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMListCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"XMList" owner:nil options:nil].firstObject;
    }
    cell.titleLb.text = [self.xmVM titleForRow:indexPath.row];
    cell.descLb.text = [self.xmVM descForRow:indexPath.row];
    cell.playTimesLb.text = [self.xmVM playconutsForRow:indexPath.row];
    cell.totalNumLb.text = [self.xmVM tracksForRow:indexPath.row];
    [cell.coverIV sd_setImageWithURL:[self.xmVM URLForcoverIVForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
    cell.selectedBackgroundView = [[UIView alloc]init];
    cell.selectedBackgroundView.backgroundColor = kRGBColor(250, 255, 254);
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsMake(0, 75, 0, 0);
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XMAlbumDetailViewController* vc = [[XMAlbumDetailViewController alloc]initWithAlbumID:[[self.xmVM albumIDForRow:indexPath.row] intValue] position:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}






@end
