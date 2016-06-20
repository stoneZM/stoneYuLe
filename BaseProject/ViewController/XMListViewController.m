//
//  XMListViewController.m
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMListViewController.h"
#import "XMListViewModel.h"
#import "XMListCell.h"
#import "XMAlbumVIewControllerViewController.h"
#import "XMAlbumDetailViewController.h"
#import "TopAlbumController.h"
#import "iCarousel.h"
@interface XMListViewController ()<UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)XMListViewModel* XMvm;
@property (nonatomic,strong)UITableView* tableView;
@property (nonatomic,strong)UILabel* moreLb;
@property (nonatomic,strong)UIBarButtonItem* item;
@property (nonatomic,strong)WMPageController* wmVC;
@property (nonatomic,strong)iCarousel* ic;
@property (nonatomic,strong)NSTimer* timer;
@property (nonatomic,strong)UIPageControl* pageControl;

@end

@implementation XMListViewController
-(WMPageController *)wmVC{
    if (_wmVC == nil) {
        _wmVC = [[WMPageController alloc]init];
    }
    return _wmVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
     self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationItem.rightBarButtonItem = self.item;
    //请求并刷新数据
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.XMvm getDataFromNetCompleteHandle:^(NSError *error) {
            if (error) {
                self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
            }
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
}
-(UIBarButtonItem *)item{
    if (_item == nil) {
        _item = [[UIBarButtonItem alloc]bk_initWithTitle:@"更多分类" style:UIBarButtonItemStyleBordered handler:^(id sender) {
             DDLogVerbose(@"--------点击了更多分类按钮--------");
            self.wmVC =  [self getPages];
            [self.navigationController pushViewController:self.wmVC animated:YES];
        }];
    }
    return _item;
}


//更多按钮上的label
-(UILabel *)moreLb{
    if (_moreLb == nil) {
        _moreLb = [UILabel new];
        _moreLb.font = [UIFont systemFontOfSize:15];
        _moreLb.textAlignment = NSTextAlignmentLeft;
    }
    return _moreLb;
}
//提供的控制的初始化方法
-(instancetype)initWithCatagoryID:(NSInteger)category staEvent:(NSString *)staEvent staModule:(NSString *)staModule
{
    if (self = [super init]) {
        self.categoryID = category;
        self.staEvent = staEvent;
        self.staModule = staModule;
        self.navigationItem.title = staModule;
    }
    return self;
}
//对xmvm的懒加载
-(XMListViewModel *)XMvm{
    if (_XMvm == nil) {
        _XMvm = [[XMListViewModel alloc]initWithCategoryID:self.categoryID staEvent:self.staEvent staModule:self.staModule];
    }
    return _XMvm;
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

    return self.XMvm.sectionNum;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.XMvm rowNumInSection:section];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
    if (indexPath.section == 0) {
        XMListCell*   cell = [[NSBundle mainBundle]loadNibNamed:@"Top50Cell" owner:nil options:nil].firstObject;
        [cell.topCoverIV sd_setImageWithURL:[self.XMvm UrlForSection:indexPath.section forRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
        cell.topTitleLb.text = [self.XMvm titleForSection:indexPath.section ForRow:indexPath.row];
        cell.topDescLb.text =  [self.XMvm descForSection:indexPath.section ForRow:indexPath.row];
        DDLogVerbose(@"%@",[self.XMvm descForSection:indexPath.section ForRow:indexPath.row]);
        return cell;
    }else{

        XMListCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"XMList" owner:nil options:nil].firstObject;
    }
     [cell.coverIV sd_setImageWithURL:[self.XMvm UrlForSection:indexPath.section forRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
     cell.titleLb.text = [self.XMvm titleForSection:indexPath.section ForRow:indexPath.row];
     cell.descLb.text =  [self.XMvm descForSection:indexPath.section ForRow:indexPath.row];
     cell.playTimesLb.text = [self.XMvm playTimesForSection:indexPath.section ForRow:indexPath.row];
     cell.totalNumLb.text = [self.XMvm tracksForSection:indexPath.section ForRow:indexPath.row];
        return cell;
    }
}

//点击某行推出专辑列表
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    //第一个分区有不同的解析，所以对应不同的控制器  Top每天50
    if (indexPath.section == 0) {
        DDLogVerbose(@"********点击了TOP50单元格************");
        TopAlbumController* vc = [[TopAlbumController alloc]initWithKey:[self.XMvm keyForTopInSection] statEven:[self.XMvm statEvenForTopInSection] statPage:self.staEvent];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
    XMAlbumDetailViewController* vc = [[XMAlbumDetailViewController alloc]initWithAlbumID:[[self.XMvm albumIDForSection:indexPath.section ForRow:indexPath.row] intValue] position:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 1 : 30;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsMake(0, 75, 0, 0);
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    return [self hearderViewInSection:section];
}

//设置每个分区的分区头
-(UIButton*)hearderViewInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    UIButton* headerButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 25)];
    headerButton.backgroundColor = [UIColor whiteColor];
    [headerButton bk_addEventHandler:^(id sender) {
        DDLogVerbose(@"##########点击了更多按钮#########");
        if (section == 1) {
            #warning 点击第二分区的更多按钮，还需传值  推出Album控制器
        }else if (section == 2){
            #warning 点击第三分区的更多按钮，还需传值  推出Album控制器
        }else{
        XMAlbumVIewControllerViewController* vc = [[XMAlbumVIewControllerViewController alloc]initWithIDDic:[self.XMvm keywordIdForMoreInSection:section]];
        [self.navigationController pushViewController:vc animated:YES];
        }
    } forControlEvents:UIControlEventTouchUpInside];
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"liveRadioCellPoint"]];
    [headerButton addSubview:self.moreLb];
    [headerButton addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    self.moreLb.text = [self.XMvm headerTitleForSection:section];
    [self.moreLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(imageView.mas_right).mas_equalTo(10);
    }];
    UIImageView* moreIV = [UIImageView new];
    moreIV.contentMode = UIViewContentModeScaleAspectFit;
    UIImage* image = [UIImage imageNamed:@"liveRadioSectionMore_Normal"];
//    UIImage* imageHl = [UIImage imageNamed:@"liveRadioSectionMore_High"];
    moreIV.image = image;
    [headerButton addSubview:moreIV];
    [moreIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(30, 20));
    }];
    return headerButton;
}


#pragma mark 添加头部滚动视图
-(iCarousel *)ic{
    if (_ic == nil) {
        _ic = [iCarousel new];
        _ic.pagingEnabled = YES;
        _ic.delegate = self;
        _ic.dataSource = self;
    }
    return _ic;
}
-(UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [UIPageControl new];
        _pageControl.enabled = NO;
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    }
    return _pageControl;
}

/** 头部视图 */
-(UIView*)headerView{
    //刷新的时候，先把原来的定时器销毁
    [self.timer invalidate];
    self.timer = nil;
    self.ic.currentItemIndex = 0;
    self.pageControl.numberOfPages = self.XMvm.focusImages.count;
    //头部视图，origin无效，宽度无效
    UIView* headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*400)];
    //添加滚动栏
    [headerView addSubview:self.ic];
    [headerView addSubview:self.pageControl];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kWindowW);
        make.height.mas_equalTo(5);
        make.bottom.mas_equalTo(-3);
    }];
    //开一个定时器，让头部视图自动滚动
   self.timer = [NSTimer bk_scheduledTimerWithTimeInterval:4 block:^(NSTimer *timer) {
        [self.ic scrollToItemAtIndex:self.ic.currentItemIndex+1 animated:YES];
    } repeats:YES];

    return headerView;
}
#pragma mark -  iCarouselDelegate,iCarouselDataSource
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.XMvm.focusImages.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (view == nil) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750*400)];
        UIImageView* imageView = [UIImageView new];
        imageView.tag = 100;
        imageView.contentMode = UIViewContentModeScaleToFill;
        view.clipsToBounds = YES;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView* imageView = [view viewWithTag:100];
    [imageView sd_setImageWithURL:[self.XMvm urlForSrcollForindex:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
     return view;
}
/** 允许循环滚动*/
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
/**监控当前滚动到第几个*/
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.pageControl.currentPage = carousel.currentItemIndex;
}


#pragma mark 

-(WMPageController*)getPages
{

    WMPageController* wmVC = [[WMPageController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self titles]];
    wmVC.keys = [[self vcKeys] mutableCopy];
    wmVC.values = [[self vcValues] mutableCopy];

    // 下划线
    wmVC.title = @"更多分类";
    wmVC.menuViewStyle = WMMenuViewStyleFloodHollow;
    wmVC.titleSizeNormal = 15;
    wmVC.menuViewStyle = WMMenuViewStyleLine;
    wmVC.titleSizeSelected = 17;
    //设置WMPageController每个标题的宽度
    wmVC.menuItemWidth = 80;
    //设置WMPageController标题栏的高度
    wmVC.menuHeight = 35;
    //设置WMPageController选中的标题的颜色
    wmVC.titleColorSelected = [UIColor colorWithRed:200 green:0 blue:0 alpha:1];
    return wmVC;
}
/**
 提供每个vc对应的key值数组
 */
-(NSArray*)vcKeys{
    NSMutableArray* arr = [NSMutableArray new];
    for(int i = 0; i<[self.XMvm headeritemNames].count;i++) {
        [arr addObject:@"IDdic"];
    }
    return  [arr copy];
}
//提供每个vc 对应的values值数组
-(NSArray*)vcValues{
    NSMutableArray* arr = [NSMutableArray new];
    for (NSDictionary* dic in [self.XMvm headerKeywordID]) {
        [arr addObject:dic];
    }
    return [arr copy];

}
-(NSArray*)titles{
    NSMutableArray* arr = [NSMutableArray new];
    NSString* string = nil;
    for (NSString* str in [self.XMvm headeritemNames]) {
        string = str;
        [arr addObject:string];
    }
    return [arr copy];
}
/**
 提供每个题目所对应的控制器的类型，题目和类型数量必须一致
 */
-(NSArray*)viewControllerClasses{
    NSMutableArray* arr = [NSMutableArray new];
    for (int i = 0; i < [self.XMvm headeritemNames].count ; i++) {
        [ arr addObject:[XMAlbumVIewControllerViewController class]];
    }
    return [arr copy];
}






@end
