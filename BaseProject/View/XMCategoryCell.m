//
//  XMCategoryCell.m
//  
//
//  Created by stone on 16/6/16.
//
//

#import "XMCategoryCell.h"

@implementation XMCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(UILabel *)leftLb{
    if (_leftLb == nil) {
        _leftLb = [UILabel new];
        _leftLb.font = [UIFont systemFontOfSize:14];
        _leftLb.textAlignment = NSTextAlignmentLeft;
        _leftLb.textColor = [UIColor blackColor];
    }
    return _leftLb;
}
-(UILabel *)rightLb{
    if (_rightLb == nil) {
        _rightLb = [UILabel new];
        _rightLb.font = [UIFont systemFontOfSize:14];
        _rightLb.textAlignment = NSTextAlignmentLeft;
        _rightLb.textColor = [UIColor blackColor];
    }
    return _rightLb;
}


-(UIImageView *)leftImageView{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc]init];
        _leftImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _leftImageView;
}
-(UIImageView *)rightImageView{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc]init];
        _rightImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _rightImageView;
}
-(UIButton *)leftButton{
    if (_leftButton == nil) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton addSubview:self.leftImageView];
        [_leftButton addSubview:self.leftLb];
        [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_leftButton);
            make.left.mas_equalTo(35);
            make.size.mas_equalTo(CGSizeMake(18, 20));
        }];
        [self.leftLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_leftButton);
            make.left.mas_equalTo(self.leftImageView.mas_right).mas_equalTo(10);
        }];
        self.imageView.backgroundColor = [UIColor blueColor];
        [_leftButton setBackgroundImage:[self imageWithColor:kRGBColor(206, 255, 248)] forState:UIControlStateHighlighted];
    }
      [_leftButton setBackgroundImage:[self imageWithColor:kRGBColor(206, 255, 248)] forState:UIControlStateHighlighted];

    return _leftButton;
}
-(UIButton *)rightButton{
    if (_rightButton == nil) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton addSubview:self.rightLb];
        [_rightButton addSubview:self.rightImageView];
        [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_rightButton);
            make.size.mas_equalTo(CGSizeMake(18, 20));
            make.left.mas_equalTo(40);
        }];
        [self.rightLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_rightButton);
            make.left.mas_equalTo(self.rightImageView.mas_right).mas_equalTo(10);
        }];
    }
       [_rightButton setBackgroundImage:[self imageWithColor:kRGBColor(253, 249, 255)] forState:UIControlStateHighlighted];

    return _rightButton;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier: reuseIdentifier];
    if (self) {
        UIView* segmentedView = [UIView new];
        segmentedView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:segmentedView];
        [self.contentView addSubview:self.leftButton];
        [self.contentView addSubview:self.rightButton];
        [segmentedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.centerX.mas_equalTo(self);
            make.width.mas_equalTo(0.5);
        }];
        [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.mas_equalTo(0);
            make.right.mas_equalTo(segmentedView.mas_left).mas_equalTo(0);
        }];
        [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.mas_equalTo(0);
            make.left.mas_equalTo(segmentedView.mas_right).mas_equalTo(0);
        }];


    }

    return self;
}
- (UIImage *)imageWithColor:(UIColor *)color {

    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
