//
//  MovieController.m
//  BaseProject
//
//  Created by stone on 16/6/27.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "MovieController.h"

@interface MovieController ()

@end

@implementation MovieController
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


- (void)viewDidLoad {
    [super viewDidLoad];

}





@end
