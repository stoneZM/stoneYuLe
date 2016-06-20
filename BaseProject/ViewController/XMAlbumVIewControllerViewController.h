//
//  XMAlbumVIewControllerViewController.h
//  BaseProject
//
//  Created by stone on 16/6/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPageController.h"
@interface XMAlbumVIewControllerViewController : UIViewController


//声明一个属性，用于接收categoryID 和 keywords
@property (nonatomic,strong)NSMutableDictionary* IDdic;

-(instancetype)initWithIDDic:(NSDictionary*)dic;


@end
