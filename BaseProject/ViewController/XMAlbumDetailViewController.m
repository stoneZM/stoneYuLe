//
//  XMAlbumDetailViewController.m
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMAlbumDetailViewController.h"
#import "AlbumListCell.h"
#import "AlbumDetailView.h"
#import "UIImage+ZMExtension.h"
#import "MusicPlayController.h"
@interface XMAlbumDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)AMAlbumDatailViewModel* xmVM;
@property (nonatomic,strong)UITableView* tableView;
@property (nonatomic,strong)AlbumDetailView* headerView;
@property (nonatomic,strong)MusicPlayController* musicPlayer;
@end

@implementation XMAlbumDetailViewController

//-(MusicPlayController *)musicPlayer{
//    if (_musicPlayer == nil) {
//        _musicPlayer = [[MusicPlayController alloc]initWithNibName:@"AlbumPlayController" bundle:nil];
//    }
//    return _musicPlayer;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.tableFooterView = [UIView new];
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
            }else{
                self.tableView.tableHeaderView = self.headerView;
                [self.tableView.header endRefreshing];
                [self.tableView reloadData];
            }
        }];
    }];
    [self.tableView.header beginRefreshing];
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

-(AlbumDetailView *)headerView{
    if (_headerView == nil) {
        _headerView = [[AlbumDetailView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 150)];
        [_headerView.coverIV.imageView sd_setImageWithURL:[self.xmVM getUrlForHeader] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
        _headerView.titleLb.text = [self.xmVM getTitleForHeader];
        _headerView.nickLb.text = [self.xmVM getnickNameForHeader];
        _headerView.playtimesLb.text = [self.xmVM getPlayCountsForHeader];
        _headerView.stateLb.text = [self.xmVM getUpdateTimeForHeader];
    }
    return _headerView;
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
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
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
    //返回一个带有边框的圆形头像

    [cell.coverIV sd_setImageWithURL:[self.xmVM urlForcoverForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_usercover"]];

    cell.titleLb.text = [self.xmVM titleForRow:indexPath.row];
    cell.playCountsLb.text = [self.xmVM playtimesRorRow:indexPath.row];
    cell.durationLb.text = [self.xmVM durationForRow:indexPath.row];
    cell.commmentLb.text = [self.xmVM commentdForRow:indexPath.row];
    cell.updatetimeLb.text = [self.xmVM updatetimeForRow:indexPath.row];
    //cell的背景色
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_bg_n"]];
    //设置cell被选中后的颜色
    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_bg_c"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeadrInSection:(NSInteger)section{
    return 5;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}

//内存中只能存在一个 MusicPlayController
static MusicPlayController* vc = nil;
-(MusicPlayController*)defaultMyself{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [[MusicPlayController alloc]initWithNibName:@"AlbumPlayController" bundle:nil];;
    });
    return vc;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [[self defaultMyself] showWithPlayUrls:[self.xmVM mp3URLsForMusicPlayer] coverIV:[self.xmVM urlStringForcoverForRow:indexPath.row] index:indexPath.row musicName:[self.xmVM titleForRow:indexPath.row]nickName:[self.xmVM getnickNameForHeader]];

}



@end
