//
//  XMListCell.h
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *descLb;
@property (weak, nonatomic) IBOutlet UILabel *playTimesLb;
@property (weak, nonatomic) IBOutlet UILabel *totalNumLb;

@property (weak, nonatomic) IBOutlet UIImageView *topCoverIV;

@property (weak, nonatomic) IBOutlet UILabel *topTitleLb;
@property (weak, nonatomic) IBOutlet UILabel *topDescLb;

@end
