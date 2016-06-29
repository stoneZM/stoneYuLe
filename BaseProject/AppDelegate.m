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
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self initializeWithApplication:application];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    CustomTabBarController* tabBar = [CustomTabBarController new];
    self.window.rootViewController = [self sideMenu];
    [self.window makeKeyAndVisible];
    [self configGlobalUIStyle];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    return YES;
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
