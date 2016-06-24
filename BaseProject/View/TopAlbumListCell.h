//
//  TopAlbumListCell.h
//  BaseProject
//
//  Created by stone on 16/6/19.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopAlbumListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *rowNumLb;
@property (weak, nonatomic) IBOutlet UIImageView *coverIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLb;
@property (weak, nonatomic) IBOutlet UILabel *tracksLb;

@end
