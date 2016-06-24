//
//  XMCategoryTableViewController.h
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMCategoryTableViewController : UITableViewController
@property (nonatomic,strong)NSNumber* infoType;
@property (nonatomic,strong)UIButton* playBtn;

+(instancetype)standVC;
@end
