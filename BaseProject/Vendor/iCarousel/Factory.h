//
//  Factory.h
//  BaseProject
//
//  Created by stone on 16/6/29.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
/** 向某个控制器上，添加菜单按钮 */
+ (void)addMenuItemToVC:(UIViewController *)vc;

/**向某个控制器上添加返回按钮*/
+(void)addBackItemToVC:(UIViewController*)vc;
@end
