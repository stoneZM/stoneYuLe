//
//  AMAlbumDatailViewModel.m
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "AMAlbumDatailViewModel.h"
#import "XMTracksModel.h"
@interface  AMAlbumDatailViewModel()
@property (nonatomic,strong)XMAlbumDetailAlbumModel* model;
@end
@implementation AMAlbumDatailViewModel

-(XMAlbumDetailAlbumModel *)model{
    if (_model == nil) {
        _model = [XMAlbumDetailAlbumModel new];
    }
    return _model;
}
//实现初始化
-(instancetype)initWithAlbumID:(NSInteger)albumID statPage:(NSString *)statPage position:(NSInteger)position
{
    if (self = [super init]) {
        self.albumID = albumID;
        self.statPage = statPage;
        self.position = position;
    }
    return self;
}
//预防性编程，使用下面的初始化方法，就是程序崩溃
-(instancetype)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 不能使用此方法初始化",__func__);
    }
    return self;
}
-(NSInteger)rowNum{
    return self.dataArr.count;
}

/**获取coverIV的URL***/
-(NSURL*)urlForcoverForRow:(NSInteger)row{
    NSString* path = [self modelForRow:row].coverSmall;
    return [NSURL URLWithString:path];
}

-(NSString*)urlStringForcoverForRow:(NSInteger)row{
    return [self modelForRow:row].coverMiddle;
}
/***获取标题**/
-(NSString*)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/***获取播放数**/
-(NSString*)playtimesRorRow:(NSInteger)row{
    NSInteger playtimes = [self modelForRow:row].playtimes;
    if (playtimes < 10000) {
        return [NSString stringWithFormat:@"%ld",playtimes];
    }else{
         return [NSString stringWithFormat:@"%.1lf万",playtimes*1.0/10000];
    }
}
/***获取评论数**/
-(NSString*)commentdForRow:(NSInteger)row{
    NSInteger comments = [self modelForRow:row].comments;
    if (comments < 10000) {
        return [NSString stringWithFormat:@"%ld",comments];
    }else{
        return [NSString stringWithFormat:@"%.1lf",comments*1.0/10000];
    }
}
/***获取播放时长**/
-(NSString*)durationForRow:(NSInteger)row{
    NSInteger duration = [self modelForRow:row].duration;
    NSInteger min = duration / 60;
    NSInteger sec = duration % 60;
    return [NSString stringWithFormat:@"%ld:%ld",min,sec];
}
/***获取播放时长给播放界面**/
-(NSInteger)durationForPlayVCForRow:(NSInteger)row{
    return [self modelForRow:row].duration;
}


/***获取更新时间**/
-(NSString*)updatetimeForRow:(NSInteger)row{
    NSInteger updatetime = [self modelForRow:row].createdAt;
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:updatetime/1000];
    DDLogVerbose(@"%--------@------",date);
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString* str = [formatter stringFromDate:date];
    return [NSString stringWithFormat:@"%@",str];
}
/**获取mp3的URL***/
-(NSString*)mp3URLForRow:(NSInteger)row{
    return [self modelForRow:row].playUrl32;
}
/**获取内存中所有的音乐地址*/
-(NSArray*)mp3URLsForMusicPlayer{
    NSMutableArray* arr = [NSMutableArray new];
    for (int i = 0; i < self.dataArr.count; i++) {
        [arr addObject:[self modelForRow:i].playUrl32];
    }
    return [arr copy];
}


//获取每一行的数据模型
-(XMAlbumDetailDataTracksListModel*)modelForRow:(NSInteger)row{
    XMAlbumDetailDataTracksListModel* model = self.dataArr[row];
    return model;
}


//网络请求，获取数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    if (self.pageID == 1) {
    [XMCatageoryNetworking getXMAlbumDetailWithAlbumId:self.albumID statPage:self.statPage statPosition:self.position compltetionHandle:^(XMAlbumDetailModel* model, NSError *error) {
        if (error) {
            completionHandle(error);
            return ;
        }
        self.model = model.data.album;
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:model.data.tracks.list];
        completionHandle(error);
    }];
    }else{
    [XMCatageoryNetworking getXMAlbumDetailWithAlbumId:self.albumID statPage:self.statPage statPosition:self.position pageID:self.pageID compltetionHandle:^(XMTracksModel* model, NSError *error) {
        self.maxPageId = model.data.maxPageId;
             [self.dataArr addObjectsFromArray:model.data.list];
                completionHandle(error);
    }];
    }
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.pageID = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if (self.pageID == self.maxPageId) {
        return ;
    }
    self.pageID += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}


/**获取表头的coverURL***/
-(NSURL*)getUrlForHeader{
    NSString* path = self.model.coverSmall;
    return [NSURL URLWithString:path];
}
/**获取题目***/
-(NSString*)getTitleForHeader{
    return self.model.title;
}
/***获取主播名称**/
-(NSString*)getnickNameForHeader{
    return self.model.nickname;
}
/***获取播放数***/
-(NSString*)getPlayCountsForHeader{
    NSInteger count = self.model.playTimes;
    return [NSString stringWithFormat:@"%.1lf万",count*1.0/10000];
}
/****获取更新时间*****/
-(NSString*)getUpdateTimeForHeader{
    NSInteger time = self.model.updatedAt;
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time/1000];
    DDLogVerbose(@"---------%@=========",date);
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString* str = [formatter stringFromDate:date];
    return [NSString stringWithFormat:@"%@更新",str];
}




@end
