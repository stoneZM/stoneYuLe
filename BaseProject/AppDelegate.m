//
//  AppDelegate.m
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "XMCategoryTableViewController.h"
#import "XMCatageoryNetworking.h"
#import "CustomTabBarController.h"
#import "SideMenuController.h"
#import "TuWanNetworking.h"
#import "VideoNetManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self initializeWithApplication:application];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [self sideMenu];
    [self.window makeKeyAndVisible];
    [self configGlobalUIStyle];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
//    [self set];
//    [VideoNetManager getVideoWithIndex:1 completionHandle:^(VideoModel *model, NSError *error) {
//
//
//    }];



    return YES;
}

-(void)set{

    //    电池条显示网络活动
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    //    检测网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        DDLogVerbose(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                self.onLine = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                self.onLine = NO;
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

-(void)configGlobalUIStyle{
    [[UINavigationBar appearance] setTranslucent:NO];
    /**配置导航栏的背景图*/
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"cell_bg_commentline"] forBarMetrics:UIBarMetricsDefault];
}

-(RESideMenu*)sideMenu{
    RESideMenu* sideMenu = [[RESideMenu alloc]initWithContentViewController:[CustomTabBarController new] leftMenuViewController:[SideMenuController new] rightMenuViewController:nil];
    sideMenu.bouncesHorizontally = NO;
    return sideMenu;
}



@end
