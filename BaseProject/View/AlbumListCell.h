//
//  AlbumListCell.h
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *playCountsLb;
@property (weak, nonatomic) IBOutlet UILabel *commmentLb;
@property (weak, nonatomic) IBOutlet UILabel *durationLb;
@property (weak, nonatomic) IBOutlet UILabel *updatetimeLb;

@end
