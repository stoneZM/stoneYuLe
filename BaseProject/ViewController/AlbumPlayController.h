//
//  AlbumPlayController.h
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMAlbumDetailViewController.h"

@interface AlbumPlayController : UIViewController

@property (nonatomic,strong)NSString* playUrl;
@property (nonatomic,strong)UIButton* playButton;
//-(AlbumPlayController*)initWithPlayUrl:(NSString*)playUrl;
@property (nonatomic)NSInteger oldCell;


+(AlbumPlayController*)defaultWithPlayUrl:(NSString *)playUrl;

@end
