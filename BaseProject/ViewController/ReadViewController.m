//
//  ReadViewController.m
//  BaseProject
//
//  Created by stone on 16/6/27.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "ReadViewController.h"

@interface ReadViewController ()

@end

@implementation ReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

@end
