//
//  XMAlbumDetailViewController.h
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMAlbumDatailViewModel.h"
@interface XMAlbumDetailViewController : UIViewController

/**
 AlbumID
 statPage
 position
 */
@property (nonatomic,assign)NSInteger albumID;
@property (nonatomic,assign)NSInteger position;

//提供初始化方法，进行传参
-(instancetype)initWithAlbumID:(NSInteger)albumID position:(NSInteger)position;

@end
