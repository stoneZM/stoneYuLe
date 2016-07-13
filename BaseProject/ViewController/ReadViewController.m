//
//  ReadViewController.m
//  BaseProject
//
//  Created by stone on 16/6/27.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "ReadViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListCell.h"
#import "TuWanPicCell.h"
#import "HtmlDetailController.h"

@interface ReadViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView* tableView;
@property (nonatomic,strong)TuWanViewModel* twVM;
@end

@implementation ReadViewController

-(instancetype)initWithinfotype:(NSInteger)infoType{
    if (self = [super init]) {
        self.infoType = infoType;
    }
    return self;
}

-(TuWanViewModel *)twVM{
    if (_twVM == nil) {
        _twVM = [[TuWanViewModel alloc]initWithInfoType:self.infoType];
    }
    return _twVM;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.estimatedRowHeight = 100;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self.twVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.twVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.twVM.rowNum;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([self.twVM showTypeForRow:indexPath.row]) {
        TuWanPicCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"TuWanPicCell" owner:nil options:nil].firstObject;
        }
       [ cell.fcoverIV sd_setImageWithURL:[self.twVM showitemsForRow:indexPath.row][0] ];
        [cell.sccoverIv sd_setImageWithURL:[self.twVM showitemsForRow:indexPath.row][1]];
        [cell.tcoverIv sd_setImageWithURL:[self.twVM showitemsForRow:indexPath.row][2]];
        cell.titleLb.text = [self.twVM titleForRow:indexPath.row];
        cell.descLb.text = [self.twVM clickforRow:indexPath.row];
        return cell;
    }else{
    TuWanListCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"TuWanListCell" owner:nil options:nil].firstObject;
    }
    [cell.coverIV sd_setImageWithURL:[self.twVM coverURLForRow:indexPath.row]];
    cell.titleLb.text = [self.twVM titleForRow:indexPath.row];
    cell.descLb.text = [self.twVM descForRow:indexPath.row];
        cell.clickLb.text = [self.twVM clickforRow:indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HtmlDetailController* vc = [[HtmlDetailController alloc]initWithWebViewURL:[self.twVM htmlURLForRow:indexPath.row]];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
