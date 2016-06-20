//
//  XMCatageoryNetworking.h
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseNetManager.h"
#import "XMListModel.h"
#import "XMAlbumModel.h"
#import "XMTopAlbumModel.h"
@interface XMCatageoryNetworking : BaseNetManager

//第一页按钮上的信息请求
+(id)getXMCatagoryListCompletionHandle:(void(^)(id responseObj, NSError* error))completionHandle;

//由第一页推出分类页的网络请求
+(id)getXMListWithCategoryId:(NSInteger)categoryId statEvent:(NSString*)statEvent statModule:(NSString*)statModule compltetionHandle:(void(^)(id responseObj,NSError* error))completionHandle;

//获取更多分类的网络请求（还需完善，可以分页加载）
+(id)getXMAlbumWithCategoryId:(NSInteger)categoryId KeywordID:(NSInteger)keywordID pageId:(NSInteger)pageId completionHandle:(void(^)(id responseObj ,NSError* error))completionHanlde;

//获取分类里面每个的详细信息及专辑的mp3url
+(id)getXMAlbumDetailWithAlbumId:(NSInteger)albumId  statPage:(NSString*)statPage  statPosition:(NSInteger)position compltetionHandle:(void(^)(id responseObj,NSError* error))completionHandle;
//
+(id)getXMAlbumDetailWithAlbumId:(NSInteger)albumId  statPage:(NSString*)statPage  statPosition:(NSInteger)position pageID:(NSInteger)pageID compltetionHandle:(void(^)(id responseObj,NSError* error))completionHandle;

//获取Top50分页内容
+(id)getTopAlbumWithkey:(NSString*)key pageID:(NSInteger)pageID statEven:(NSString*)statEven statPage:(NSString*)statPage complatetionHandle:(void(^)(id responseObj,NSError* error))complationHandle;

/**
 key
 pageId
 statModule
 statPage
 */
@end
