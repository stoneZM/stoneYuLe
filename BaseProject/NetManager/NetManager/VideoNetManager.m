//
//  VideoNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoNetManager.h"

@implementation VideoNetManager

+ (id)getVideoWithIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path=[NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html", (long)index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoModel objectWithKeyValues:responseObj], error);
    }];
}

@end








