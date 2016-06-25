//
//  MusicPlayController.h
//  BaseProject
//
//  Created by stone on 16/6/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMAlbumDetailModel.h"

@interface MusicPlayController : UIViewController


@property (nonatomic,strong)NSArray* musicModels;

-(void)showWithMusicModels:(NSArray*)musicModels index:(NSInteger)index;


@end
