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
- (instancetype)init {
    if (self = [super init]) {
        self.menuHeight = 40.0;
        self.menuViewStyle =WMMenuViewStyleLine;
        self.itemsWidths = @[@120,@60,@120];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
//    self.title = @"测试";
    self.menuView.progressWidths = @[@110, @50, @110];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(NSArray*)vcs{
    NSMutableArray* arr = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        [arr addObject:[MovieController class]];
    }
    return [arr copy];
}
-(NSArray*)titles{
    NSArray* arr = @[@"第一个控制器",@"第二个",@"第三个控制器啊"];
    return arr;
}


-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return [self titles].count;
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    return [MovieController new];
}
-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return [self titles][index];
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    NSLog(@"%@", info);
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
