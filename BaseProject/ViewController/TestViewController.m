//
//  TestViewController.m
//  BaseProject
//
//  Created by stone on 16/6/27.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TestViewController.h"
#import "MovieController.h"

@interface TestViewController ()

@end

@implementation TestViewController
-(void)viewDidLoad{

    [super viewDidLoad];
}

//设置tabBar的图片
-(void)settabBarImage{
    UIImage* norImage = [UIImage imageNamed:@"tabbar_sound_n"];
    norImage = [norImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage* selectedImage = [UIImage imageNamed:@"tabbar_sound_h"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tabBarItem setImage:norImage];
    [self.tabBarItem setSelectedImage:selectedImage];
    [self.tabBarItem setImageInsets:UIEdgeInsetsMake(5,0,-5,0)];
}



@end
