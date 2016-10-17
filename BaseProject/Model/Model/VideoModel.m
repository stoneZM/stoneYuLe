//
//  VideoModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
//定义两个数组对象中的元素，对应的解析类
+ (NSDictionary *)objectClassInArray{
    return @{@"videoSidList":[VideoVideoSidListModel class],
             @"videoList": [VideoVideoListModel class]};
}

@end

@implementation VideoVideoListModel
//因为服务器传入串的key是description，系统关键词。 我们属性无法命名为系统关键词，只能改为desc。改动后需要通知MJExtension
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"desc": @"description",
             @"m3u8Url": @"m3u8_url",
             @"m3u8HdUrl":@"m3u8Hd_url",
             @"mp4Url":@"mp4_url",
             @"mp4HdUrl":@"mp4Hd_url"
             };
}

@end

@implementation VideoVideoSidListModel

@end










