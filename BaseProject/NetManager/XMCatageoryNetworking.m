//
//  XMCatageoryNetworking.m
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMCatageoryNetworking.h"
#import "XMCatageoryModel.h"
#import "XMAlbumDetailModel.h"
#import "XMTracksModel.h"

#define KPath        @"http://mobile.ximalaya.com/mobile/discovery/v1/categories"
#define KpicVersion @13
#define KDevice     @"iPhone"
#define KScale      @2

@implementation XMCatageoryNetworking

+(id)getXMCatagoryListCompletionHandle:(void (^)(id, NSError *))completionHandle{

    NSMutableDictionary* dic = [[NSMutableDictionary alloc]init];
    [dic setValue:KDevice     forKey:@"device"];
    [dic setValue:KpicVersion forKey:@"picVersion"];
    [dic setValue:KScale      forKey:@"scale"];
    return [self GET:KPath parameters:dic completionHandler:^(id responseObj, NSError *error) {
        completionHandle([XMCatageoryModel objectWithKeyValues:responseObj],error);
    }];
}

#define KXMListPath @"http://mobile.ximalaya.com/mobile/discovery/v3/category/recommends"


+(id)getXMListWithCategoryId:(NSInteger)categoryId statEvent:(NSString *)statEvent statModule:(NSString *)statModule compltetionHandle:(void (^)(id, NSError *))completionHandle{

    NSMutableDictionary* dic = [NSMutableDictionary new];
    [dic setValue:[NSString stringWithFormat:@"%ld",categoryId]forKey:@"categoryId"];
    [dic setValue:@"album" forKey:@"contentType"];
    [dic setValue:@"iPhone" forKey:@"device"];
    [dic setValue:@"2" forKey:@"scale"];
    [dic setValue:[NSString stringWithFormat:@"pageview/category@%@",statEvent] forKey:@"statEvent"];
    [dic setValue:[NSString stringWithFormat:@"%@",statModule] forKey:@"statModule"];
    [dic setValue:@"tab@发现_分类" forKey:@"statPage"];
    [dic setValue:@"4.3.86" forKey:@"version"];
    return [self GET:KXMListPath parameters:dic completionHandler:^(id responseObj, NSError *error) {
        completionHandle([XMListModel objectWithKeyValues:responseObj],error);
    }];
}



//@"http://mobile.ximalaya.com/mobile/discovery/v1/category/keyword/albums?calcDimension=hot&categoryId=3&device=iPhone&keywordId=232&pageId=1&pageSize=20&statEvent=pageview/category@有声书&statModule=有声书&statPage=tab@发现_分类&status=0"
#define KXMAlbumPath @"http://mobile.ximalaya.com/mobile/discovery/v1/category/keyword/albums"

+(id)getXMAlbumWithCategoryId:(NSInteger)categoryId KeywordID:(NSInteger)keywordID pageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHanlde{

    NSMutableDictionary* dic = [NSMutableDictionary new];
    [dic setValue:@"hot"   forKey:@"calcDimension"];
    [dic setValue:[NSString stringWithFormat:@"%ld",categoryId]forKey:@"categoryId"];
    [dic setValue:@"iPhone" forKey:@"device"];
    [dic setValue:[NSString stringWithFormat:@"%ld",keywordID]forKey:@"keywordId"];
    [dic setValue:[NSString stringWithFormat:@"%ld",pageId] forKey:@"pageId"];
    [dic setValue:@"20" forKey:@"pageSize"];
    [dic setValue:@"pageview/category@有声书" forKey:@"statEvent"];
    [dic setValue:@"有声书" forKey:@"statModule"];
    [dic setValue:@"tab@发现_分类" forKey:@"statPage"];
    [dic setValue:@"0" forKey:@"status"];
    return [self GET:KXMAlbumPath parameters:dic completionHandler:^(id responseObj, NSError *error) {
        completionHanlde([XMAlbumModel objectWithKeyValues:responseObj],error);
    }];

}

/**
 @"http://mobile.ximalaya.com/mobile/v1/album?albumId=3160816&device=iPhone&pageSize=20&source=5&statEvent=pageview/album@3160816&statModule=有声书_幻想&statPage=categorytag@有声书_幻想&statPosition=2"
 
http://mobile.ximalaya.com/mobile/v1/album?albumId=2941387&device=iPhone&pageSize=20&source=0&statEvent=pageview/album@2941387&statModule=有声书每日TOP50&statPage=ranklist@有声书每日TOP50&statPosition=1
 专辑的网络请求

 @param albumId          专辑的id
 @param statEvent        专辑的id
 @param statPage         专辑所在的分类
 @param position         由上到下所处的位置
 
 */

#define KAlbumDetailPath  @"http://mobile.ximalaya.com/mobile/v1/album"

+(id)getXMAlbumDetailWithAlbumId:(NSInteger)albumId statPage:(NSString *)statPage statPosition:(NSInteger)position compltetionHandle:(void (^)(id, NSError *))completionHandle{

    NSMutableDictionary* dic = [NSMutableDictionary new];
    [dic setValue:[NSString stringWithFormat:@"%ld",albumId] forKey:@"albumId"];
    [dic setValue:@"iPhone" forKey:@"device"];
    [dic setValue:@"20" forKey:@"pageSize"];
    [dic setValue:@"5" forKey:@"source"];
    [dic setValue:[NSString stringWithFormat:@"pageview/album@%ld",albumId] forKey:@"statEvent"];
    [dic setValue:[NSString stringWithFormat:@"有声书_%@",statPage] forKey:@"statModule"];
    [dic setValue:[NSString stringWithFormat:@"categorytag@有声书_%@",statPage] forKey:@"statPage"];
    [dic setValue:[NSString stringWithFormat:@"%ld",position] forKey:@"statPosition"];
    return [self GET:KAlbumDetailPath parameters:dic completionHandler:^(id responseObj, NSError *error) {
        completionHandle([XMAlbumDetailModel objectWithKeyValues:responseObj],error);
    }];
}

/**
 @"http://mobile.ximalaya.com/mobile/v1/album/track?albumId=4301956&device=iPhone&isAsc=true&pageId=2&pageSize=20&statEvent=pageview/album@4301956&statModule=有声书_悬疑&statPage=categorytag@有声书_悬疑&statPosition=1"

 @return 返回集数
 */


#define KAlbumDetailPathWithPageID  @"http://mobile.ximalaya.com/mobile/v1/album/track"

+(id)getXMAlbumDetailWithAlbumId:(NSInteger)albumId statPage:(NSString *)statPage statPosition:(NSInteger)position pageID:(NSInteger)pageID compltetionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary* dic = [NSMutableDictionary new];
    [dic setValue:[NSString stringWithFormat:@"%ld",albumId] forKey:@"albumId"];
    [dic setValue:@"iPhone" forKey:@"device"];
    [dic setValue:@"true" forKey:@"isAsc"];
    [dic setValue:[NSString stringWithFormat:@"%ld",pageID] forKey:@"pageId"];
    [dic setValue:@"20" forKey:@"pageSize"];
    [dic setValue:[NSString stringWithFormat:@"pageview/album@%ld",albumId] forKey:@"statEvent"];
    [dic setValue:[NSString stringWithFormat:@"有声书_%@",statPage] forKey:@"statModule"];
    [dic setValue:[NSString stringWithFormat:@"categorytag@有声书_%@",statPage] forKey:@"statPage"];
    [dic setValue:[NSString stringWithFormat:@"%ld",position] forKey:@"statPosition"];
    return [self GET:KAlbumDetailPathWithPageID parameters:dic completionHandler:^(id responseObj, NSError *error) {
        completionHandle([XMTracksModel objectWithKeyValues:responseObj],error);
    }];
}

/**
 @"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/album?device=iPhone&key=2_3_ranking:album:played:1:3&pageId=1&pageSize=20&scale=3&statEvent=pageview/ranklist@有声书每日TOP50&statModule=排行榜&statPage=category@有声书
 返回top50的详情页

 @param key              上一页的key
 @param pageID           分页加载所需的页数
 @param statPage
 */

#define KTopAlbumPath @"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/album"
+(id)getTopAlbumWithkey:(NSString*)key pageID:(NSInteger)pageID statEven:(NSString*)statEven statPage:(NSString *)statPage complatetionHandle:(void (^)(id, NSError *))complationHandle{
    NSMutableDictionary* dic = [NSMutableDictionary new];

    [dic setValue:@"iPhone" forKey:@"device"];
    [dic setValue:key forKey:@"key"];
    [dic setValue:[NSString stringWithFormat:@"%ld",pageID] forKey:@"pageId"];
    [dic setValue:@"20" forKey:@"pageSize"];
    [dic setValue:@"3" forKey:@"scale"];
    [dic setValue:[NSString stringWithFormat:@"pageview/ranklist@%@",statEven] forKey:@"statEvent"];
    [dic setValue:@"排行榜" forKey:@"statModule"];
    [dic setValue:[NSString stringWithFormat:@"%@",statPage] forKey:@"statPage"];
return [self GET:KTopAlbumPath parameters:dic completionHandler:^(id responseObj, NSError *error) {
    complationHandle([XMTopAlbumModel objectWithKeyValues:responseObj],error);
}];
}






@end
