//
//  BaseViewModel.m
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)cancelTask{
    [self.dataTask cancel];
}

- (void)suspendTask{
    [self.dataTask suspend];
}

- (void)resumeTask{
    [self.dataTask resume];
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

@end
