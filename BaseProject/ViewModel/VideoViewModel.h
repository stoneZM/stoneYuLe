//
//  VideoViewModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManager.h"

@interface VideoViewModel : BaseViewModel

@property(nonatomic) NSInteger rowNumber;
@property(nonatomic) NSInteger index;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)descForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSURL *)videoURLForRow:(NSInteger)row;


@end


















