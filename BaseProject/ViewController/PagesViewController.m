//
//  PagesViewController.m
//  BaseProject
//
//  Created by stone on 16/7/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "PagesViewController.h"
#import "ReadViewController.h"


static UINavigationController* navi = nil;
@interface PagesViewController ()

@end

@implementation PagesViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UIImage* norImage = [UIImage imageNamed:@"tabbar_sound_n"];
        norImage = [norImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage* selectedImage = [UIImage imageNamed:@"tabbar_sound_h"];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.tabBarItem setImage:norImage];
        [self.tabBarItem setSelectedImage:selectedImage];

        [self.tabBarItem setImageInsets:UIEdgeInsetsMake(5,0,-5,0)];

    }
    return self;
}

+(UINavigationController *)standNavi{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        PagesViewController* vc = [PagesViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray*)vcsForPages{
    NSMutableArray* arr = [NSMutableArray new];
    for (int i = 0; i < 15; i++) {
        [arr addObject:[ReadViewController class]];
    }
    return arr;
}
-(NSArray*)titleForPages{
    return @[@"头条",@"独家",@"黑暗3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视屏",@"功略",@"幻化",@"趣闻",@"cos",@"美女"];
}

-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 15;
}
-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return [self titleForPages][index];
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    return [[ReadViewController alloc]initWithinfotype:index];
}





@end
