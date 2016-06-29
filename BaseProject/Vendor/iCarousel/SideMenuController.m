//
//  SideMenuController.m
//  BaseProject
//
//  Created by stone on 16/6/29.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "SideMenuController.h"

@interface SideMenuController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView* tableView;
@end

@implementation SideMenuController

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(kWindowW, 300));
            _tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //去掉分割线
            _tableView.backgroundColor = [UIColor clearColor];              //去掉背景色
            _tableView.delegate = self;
            _tableView.dataSource = self;
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackgroundImage];
    [self.tableView reloadData];
}
-(void)setBackgroundImage{
    UIImageView* imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"Stars"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [self titles][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self images][indexPath.row]];
    [self cellSelectedBackGround:cell];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(NSArray*)titles{
    NSArray* titles = @[@"主页",@"设置",@"清空缓存",@"关于娱乐",@"退出"];
    return titles;
}
-(NSArray*)images{
    NSArray* images = @[@"IconHome", @"IconCalendar", @"IconProfile", @"IconSettings", @"IconEmpty"];
    return images;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//设置点击后cell显示的颜色
-(void)cellSelectedBackGround:(UITableViewCell*)cell{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = view;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:17];
}

@end
