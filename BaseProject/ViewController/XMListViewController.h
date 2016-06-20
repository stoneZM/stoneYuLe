//
//  XMListViewController.h
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPageController.h"
@interface XMListViewController : UIViewController
@property (nonatomic,assign)NSInteger categoryID;
@property (nonatomic,strong)NSString* staEvent;
@property (nonatomic,strong)NSString* staModule;

//此处id由第一页的点击按钮事件所传
-(instancetype)initWithCatagoryID:(NSInteger)category staEvent:(NSString*)staEvent staModule:(NSString*)staModule;


@end
