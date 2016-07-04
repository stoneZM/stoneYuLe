//
//  AlboutYuLeController.m
//  BaseProject
//
//  Created by stone on 16/6/29.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "AlboutYuLeController.h"
#import "CustomTabBarController.h"
@interface AlboutYuLeController ()

@end

@implementation AlboutYuLeController

+ (UINavigationController *)standardYuLeNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AlboutYuLeController *vc = [[AlboutYuLeController alloc]initWithNibName:@"AlboutYuLeController" bundle:nil];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
    [Factory addMenuItemToVC:self];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
