//
//  AlbumDetailView.m
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "AlbumDetailView.h"

#define KSubDtailTextFont 13
#define KTitleTextFont    17
#define KTextColor        [UIColor lightGrayColor]

@interface AlbumDetailView ()
@property (nonatomic,strong)UILabel* zhuboLb;
@property (nonatomic,strong)UILabel* bofangLb;
@property (nonatomic,strong)UILabel* zhuangtaiLb;

@end

@implementation AlbumDetailView

- (void)drawRect:(CGRect)rect {
    // Drawing code
}
-(UILabel *)zhuboLb{
    if (_zhuboLb == nil) {
        _zhuboLb = [UILabel new];
        _zhuboLb.font = [UIFont systemFontOfSize:KSubDtailTextFont];
        _zhuboLb.textColor = KTextColor;
        _zhuboLb.text = @"主播:";
    }
    return _zhuboLb;
}
-(UILabel *)bofangLb{
    if (_bofangLb == nil) {
        _bofangLb = [UILabel new];
        _bofangLb.font = [UIFont systemFontOfSize:KSubDtailTextFont];
        _bofangLb.textColor = KTextColor;
        _bofangLb.text = @"播放:";
    }
    return _bofangLb;
}
-(UILabel *)zhuangtaiLb{
    if (_zhuangtaiLb == nil) {
        _zhuangtaiLb = [UILabel new];
       _zhuangtaiLb.font = [UIFont systemFontOfSize:KSubDtailTextFont];
        _zhuangtaiLb.textColor = KTextColor;
        _zhuangtaiLb.text = @"播放:";
    }
    return _zhuangtaiLb;
}
-(ZmImageView *)coverIV{
    if (_coverIV == nil) {
        _coverIV = [[ZmImageView alloc]init];;
    }
    return _coverIV;
}

-(UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:KTitleTextFont];
        _titleLb.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLb;
}
-(UILabel *)nickLb{
    if (_nickLb == nil) {
        _nickLb = [UILabel new];
        _nickLb.textColor = kRGBColor(22, 130, 246);
        _nickLb.font = [UIFont systemFontOfSize:KSubDtailTextFont];
        _nickLb.textAlignment = NSTextAlignmentLeft;
    }
    return _nickLb;
}

-(UILabel*)playtimesLb{
    if (_playtimesLb == nil) {
        _playtimesLb = [UILabel new];
        _playtimesLb.font = [UIFont systemFontOfSize:KSubDtailTextFont];
        _nickLb.textAlignment = NSTextAlignmentLeft;
        _nickLb.textColor = KTextColor;
    }
    return _nickLb;
}

-(UILabel *)stateLb{
    if (_stateLb == nil) {
        _stateLb = [UILabel new];
        _stateLb.font = [UIFont systemFontOfSize:KSubDtailTextFont];
        _stateLb.textColor = KTextColor;
        _stateLb.textAlignment = NSTextAlignmentLeft;
    }
    return _stateLb;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self addSubview:self.zhuboLb];
        [self addSubview:self.bofangLb];
        [self addSubview:self.zhuangtaiLb];
        [self addSubview:self.coverIV];
        [self addSubview:self.titleLb];
        [self addSubview:self.nickLb];
        [self addSubview:self.playtimesLb];
        [self addSubview:self.stateLb];
        [self.coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(150, 150));
        }];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.coverIV.mas_topMargin);
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(30);

        }];
        [self.zhuboLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(15);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
        }];
        [self.nickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.zhuboLb.mas_topMargin);
            make.bottomMargin.mas_equalTo(self.zhuboLb.mas_bottomMargin);
            make.left.mas_equalTo(self.zhuboLb.mas_right).mas_equalTo(5);
        }];

        [self.bofangLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.zhuboLb.mas_bottom).mas_equalTo(5);
        }];
        [self.playtimesLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.bofangLb.mas_topMargin);
            make.bottomMargin.mas_equalTo(self.bofangLb.mas_bottomMargin);
            make.leftMargin.mas_equalTo(self.nickLb.mas_leftMargin);
        }];

        [self.zhuangtaiLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.bofangLb.mas_bottom).mas_equalTo(5);
        }];
        [self.stateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.zhuangtaiLb.mas_topMargin);
            make.bottomMargin.mas_equalTo(self.zhuangtaiLb.mas_bottomMargin);
            make.leftMargin.mas_equalTo(self.nickLb.mas_leftMargin);
        }];
    }
    return self;
}




@end
