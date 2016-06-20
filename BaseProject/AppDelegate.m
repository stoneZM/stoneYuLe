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
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self initializeWithApplication:application];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    XMCategoryTableViewController* vc = [[XMCategoryTableViewController alloc]init];
    UINavigationController* navi = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];

    [XMCatageoryNetworking getXMAlbumDetailWithAlbumId:3160816 statPage:@"幻想" statPosition:2 compltetionHandle:^(id responseObj, NSError *error) {


    }];
//    [XMCatageoryNetworking getXMAlbumDetailWithAlbumId:2941387 statPage:nil statPosition:2 pageID:2 compltetionHandle:^(id responseObj, NSError *error) {
//
//    }];
    //@"key=2_3_ranking:album:played:1:3&pageId=1&pageSize=20&scale=3&statEvent=pageview/ranklist@有声书每日TOP50&statModule=排行榜&statPage=category@有声书

//    [XMCatageoryNetworking getTopAlbumWithkey:@"2_3_ranking:album:played:1:3" pageID:1 statEven:@"有声书每日TOP50" statPage:@"有声书" complatetionHandle:^(id responseObj, NSError *error) {
//
//    }];
//    NSString* str = [@"http://mobile.ximalaya.com/mobile/v1/album?albumId=2941387&device=iPhone&pageSize=20&source=0&statEvent=pageview%2Falbum%402941387&statModule=%E6%9C%89%E5%A3%B0%E4%B9%A6%E6%AF%8F%E6%97%A5TOP50&statPage=ranklist%40%E6%9C%89%E5%A3%B0%E4%B9%A6%E6%AF%8F%E6%97%A5TOP50&statPosition=1" stringByRemovingPercentEncoding];
//    NSLog(@"%@",str);

    return YES;
}

@end
