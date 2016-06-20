//
//  ZmImageView.m
//  BaseProject
//
//  Created by stone on 16/6/1.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZmImageView.h"

@implementation ZmImageView

-(instancetype)init
{
    self = [super init];
    if (self) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        self.clipsToBounds = YES;
    }
    return self;
}

@end
