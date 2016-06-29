//
//  AlbumDetailView.h
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumDetailView : UIView


@property (nonatomic,strong)ZmImageView* coverIV;
@property (nonatomic,strong)UILabel* titleLb;
@property (nonatomic,strong)UILabel* nickLb;
@property (nonatomic,strong)UILabel* playtimesLb;
@property (nonatomic,strong)UILabel* stateLb;

@property (nonatomic,strong)UIButton* orderAlbumBt;
@property (nonatomic,strong)UIButton* downloadBt;

@end
