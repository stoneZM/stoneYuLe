//
//  CustomTabBarController.m
//  
//
//  Created by stone on 16/6/27.
//
//

#import "CustomTabBarController.h"
#import "XMCategoryTableViewController.h"
#import "MovieController.h"
#import "ReadViewController.h"
#import "UIView+Extension.h"
#import "TestViewController.h"
#import "PagesViewController.h"
#import "VideoTableViewController.h"
@interface CustomTabBarController ()

@end


@implementation CustomTabBarController

+(CustomTabBarController*)standTabBar{

  static  CustomTabBarController* tabBar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabBar = [CustomTabBarController new];
    });
    return tabBar;
}

-(NSArray*)vcArr{
    XMCategoryTableViewController* XMvc = [XMCategoryTableViewController new];
    UINavigationController* XMnavi = [[UINavigationController alloc]initWithRootViewController:XMvc];
    [XMvc.tabBarController setHidesBottomBarWhenPushed:YES];
    [XMvc settabBarImage];
    
//    MovieController* MVvc = [[MovieController alloc]init];
//    [MVvc settabBarImage];
//    TestViewController* vc = [[TestViewController alloc]init];
//    [vc settabBarImage];
//    UINavigationController* RDnavi = [[UINavigationController alloc]initWithRootViewController:vc];
    //ReadViewController* vc2 = [ReadViewController new];
    VideoTableViewController* vc = [[VideoTableViewController alloc]init];
    UINavigationController* movnavi = [[UINavigationController alloc]initWithRootViewController:vc];
    [vc settabBarImage];
    UINavigationController* navi = [PagesViewController standNavi];
    NSArray* arr = [NSArray arrayWithObjects:XMnavi,movnavi,navi,nil];
    return arr;
}

-(void)configureTabBar{

    //获取UITabBarItem的分格
    UITabBarItem* barItem = [UITabBarItem appearance];
    //设置item中文字的位置
    [barItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];

    //设置item中文字的不同样式
    NSMutableDictionary* normalAttributes = [NSMutableDictionary dictionary];
    normalAttributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    normalAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [barItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];

    //设置item中文字被选中的样式
    NSMutableDictionary* selectAttributes = [NSMutableDictionary dictionary];
    selectAttributes[NSForegroundColorAttributeName] = [UIColor redColor];
    selectAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [barItem setTitleTextAttributes:selectAttributes forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewControllers:[self vcArr] animated:YES];
    [self configureTabBar];
    self.tabBar.translucent = NO; //设置不透明
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
