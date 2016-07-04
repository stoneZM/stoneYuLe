//
//  AlboutSetController.m
//  BaseProject
//
//  Created by stone on 16/6/29.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "AlboutSetController.h"

@interface AlboutSetController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property (nonatomic,strong)UITableView* tableView;
@property (nonatomic,strong)NSString* cacheFileSize;
@end

@implementation AlboutSetController

+(UINavigationController *)standNavi{
    static UINavigationController* navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AlboutSetController* vc = [AlboutSetController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
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
    self.title = @"清除占用空间";
    [Factory addMenuItemToVC:self];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UILabel* label = [UILabel new];
    [cell.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
    }];
    label.textColor = [UIColor orangeColor];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"占用总空间";
            label.text = [self getCacheFileSize];
        }
    }else{
        if (indexPath.row == 0) {
            cell.textLabel.text = @"下载占用总空间";
            label.text = @"0.00M";
        }
        else {
            [self addButtonForCell:cell];
            cell.textLabel.text = @"缓存占用总空间";
            label.text =[self getCacheFileSize];
            NSLog(@"label %@",[self getCacheFileSize]);
        }
    }
    return cell;
}


-(NSString*)getCacheFileSize{
    //定义变量存储总的缓存大小
        long long sumSize = 0;
         //01.获取当前图片缓存路径
    NSString* libFilePath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    NSString* cacheFilePath = [libFilePath stringByAppendingPathComponent:@"Caches"];
         //02.创建文件管理对象
         NSFileManager *filemanager = [NSFileManager defaultManager];
        //获取当前缓存路径下的所有子路径
         NSArray *subPaths = [filemanager subpathsAtPath:cacheFilePath];
        NSLog(@"------%ld",subPaths.count);
        //遍历所有子文件
         for (NSString *subPath in subPaths) {
             //1）.拼接完整路径
        NSString *filePath = [cacheFilePath stringByAppendingPathComponent:subPath];
        //2）.计算文件的大小
        long long fileSize = [[filemanager attributesOfItemAtPath:filePath error:nil]fileSize];
             //3）.加载到文件的大小
        sumSize += fileSize;
         }
        float size_m = sumSize*1.0/(1000*1000);
    NSLog(@"------size_m%f",size_m);
    return [NSString stringWithFormat:@"%.2fM",size_m];

}

-(void)clearCache{


    NSString* libFilePath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    NSString* cacheFilePath = [libFilePath stringByAppendingPathComponent:@"Caches"];
    //02.创建文件管理对象
    NSFileManager *filemanager = [NSFileManager defaultManager];
    //获取当前缓存路径下的所有子路径
    NSArray *subPaths = [filemanager subpathsAtPath:cacheFilePath];

    for (NSString *subPath in subPaths) {

        NSString *filePath = [cacheFilePath stringByAppendingPathComponent:subPath];
        [filemanager removeItemAtPath:filePath error:nil];
    }

}
-(void)setCacheFileSize:(NSString *)cacheFileSize{
    [self.tableView reloadData];
}


-(void)addButtonForCell:(UITableViewCell*)cell{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [cell.contentView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"清空" forState:UIControlStateNormal];
    [button bk_addEventHandler:^(id sender) {

        if ([[self getCacheFileSize] isEqualToString:@"0.00M"]) {
            [self customViewExample];
        }else{

            UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"是否清空缓存" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];

        }
    } forControlEvents:UIControlEventTouchUpInside];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {

    }else{

        [self modeSwitching];

    }
}

- (void)modeSwitching {

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];

    hud.labelText = NSLocalizedString(@"Preparing...", @"HUD preparing title");
    hud.minSize = CGSizeMake(150.f, 100.f);
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{

        [self clearCacheWithMixedProgress];

        dispatch_async(dispatch_get_main_queue(), ^{

            [hud hide:YES afterDelay:0.5];
        });
    });
}

- (void)clearCacheWithMixedProgress {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.navigationController.view];

    dispatch_async(dispatch_get_main_queue(), ^{
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.labelText = NSLocalizedString(@"正在清理...", @"HUD cleanining up title");
        
        [self clearCache];                  //清除缓存
    });
    sleep(2);
    dispatch_sync(dispatch_get_main_queue(), ^{
        UIImage *image = [[UIImage imageNamed:@"wifibox_checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        hud.customView = imageView;
        hud.mode = MBProgressHUDModeCustomView;
        hud.labelText = NSLocalizedString(@"清理完毕", @"HUD completed title");
        [self.tableView reloadData];        //刷新table
    });
    sleep(1);
}

- (void)customViewExample {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];

    hud.mode = MBProgressHUDModeCustomView;

    hud.square = NO;

    hud.labelText = NSLocalizedString(@"亲，无缓存可清理哦！", @"HUD done title");

    [hud hide:YES afterDelay:1];
}

@end
