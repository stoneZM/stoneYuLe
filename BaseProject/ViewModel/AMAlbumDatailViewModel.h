//
//  AMAlbumDatailViewModel.h
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//


#import "XMCatageoryNetworking.h"
#import "BaseViewModel.h"
#import "XMAlbumDetailModel.h"
@interface AMAlbumDatailViewModel : BaseViewModel

//网络请求所需的参数
@property (nonatomic,assign)NSInteger albumID;
@property (nonatomic,strong)NSString* statPage;
@property (nonatomic,assign)NSInteger position;

@property (nonatomic,assign)NSInteger pageID;
@property (nonatomic,assign)NSInteger maxPageId;

//行数
@property (nonatomic,assign)NSInteger rowNum;

//提供初始化方法，用于从控制器端传入参数
-(instancetype)initWithAlbumID:(NSInteger)albumID statPage:(NSString*)statPage position:(NSInteger)position;

/**获取coverIV的URL***/
-(NSURL*)urlForcoverForRow:(NSInteger)row;
/***获取标题**/
-(NSString*)titleForRow:(NSInteger)row;
/***获取播放数**/
-(NSString*)playtimesRorRow:(NSInteger)row;
/***获取评论数**/
-(NSString*)commentdForRow:(NSInteger)row;
/***获取播放时长**/
-(NSString*)durationForRow:(NSInteger)row;
/***获取更新时间**/
-(NSString*)updatetimeForRow:(NSInteger)row;
/**获取mp3的URL***/
-(NSString*)mp3URLForRow:(NSInteger)row;
-(NSString*)urlStringForcoverForRow:(NSInteger)row;

/**获取表头的coverURL***/
-(NSURL*)getUrlForHeader;
/**获取题目***/
-(NSString*)getTitleForHeader;
/***获取主播名称**/
-(NSString*)getnickNameForHeader;
/***获取播放数***/
-(NSString*)getPlayCountsForHeader;
/****获取更新时间*****/
-(NSString*)getUpdateTimeForHeader;


@end
