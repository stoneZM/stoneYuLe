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
    _coverIV.layer.cornerRadius = _coverIV.bounds.size.width / 2;
    _coverIV.contentMode = UIViewContentModeScaleAspectFill;
    _coverIV.layer.borderWidth = 3;
    _coverIV.layer.borderColor = [UIColor orangeColor].CGColor;
    [_coverIV setClipsToBounds:YES];
    [_coverIV.layer setMasksToBounds:YES];
    return _coverIV;
}

- (IBAction)clickToDownLoadSong:(UIButton *)sender {
  //TODO: 下载按钮
}






@end
