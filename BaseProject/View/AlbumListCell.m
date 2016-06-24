//
//  AlbumListCell.m
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "AlbumListCell.h"
#import "UIImage+Extension.h"
@implementation AlbumListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UIImageView *)coverIV{
    _coverIV.layer.cornerRadius = 22;
    return _coverIV;
}

- (IBAction)clickToDownLoadSong:(UIButton *)sender {
  //TODO: 下载按钮
}






@end
