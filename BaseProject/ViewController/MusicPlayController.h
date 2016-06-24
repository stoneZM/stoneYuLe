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

@property (nonatomic,strong)NSString* coverURL;
@property (nonatomic,strong)NSString* playUrl;
@property (nonatomic,strong)NSArray* allMusicUrls;
@property (nonatomic,assign)NSInteger currentIndex;
@property (nonatomic,strong)NSString* musicName;
@property (nonatomic,strong)NSString* nickName;


-(void)showWithPlayUrls:(NSArray*)allMusicUrls coverIV:(NSString*)coverURL index:(NSInteger)index musicName:(NSString*)name nickName:(NSString*)nickName;




@end
