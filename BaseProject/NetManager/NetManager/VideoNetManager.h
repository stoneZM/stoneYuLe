//
//  VideoNetManager.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideoModel.h"
#import "VideoModel.h"

@interface VideoNetManager : BaseNetManager
//http://c.m.163.com/nc/video/home/0-10.html

+(id)getVideoWithIndex:(NSInteger)index completionHandle:(void (^)(id model, NSError *))completionHandle;



@end














