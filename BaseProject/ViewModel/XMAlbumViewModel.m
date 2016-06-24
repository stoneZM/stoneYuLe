//
//  XMAlbumViewModel.m
//  BaseProject
//
//  Created by stone on 16/6/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMAlbumViewModel.h"
@interface XMAlbumViewModel()

@end
@implementation XMAlbumViewModel

//提供特定的初始化方法，以便传参
-(instancetype)initWithCatagoruId:(NSInteger)categoryId KeywordID:(NSInteger)keywordID{
    if (self = [super init]) {
        self.categoryId = categoryId;
        self.keywordId = keywordID;
    }
    return self;
}
//崩溃提示
-(instancetype)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 不能此方法初始化", __func__);
    }
    return self;
}
//返回封面图片的URL
-(NSURL*)URLForcoverIVForRow:(NSInteger)row{
    NSString* path = [self modelForRow:row].coverSmall;
    return [NSURL URLWithString:path];
}
/**返回标题**/
-(NSString*)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/**返回描述**/
-(NSString*)descForRow:(NSInteger)row{
    return [self modelForRow:row].intro;
}
/*返回播放次数**/
-(NSString*)playconutsForRow:(NSInteger)row{
    NSInteger count = [self modelForRow:row].playsCounts;
    return [NSString stringWithFormat:@"%.1lf万",count*1.0/10000];
}
/**返回集数**/
-(NSString*)tracksForRow:(NSInteger)row{
    NSInteger tracks = [self modelForRow:row].tracks;
    return [NSString stringWithFormat:@"%ld集",tracks];
}

/***返回行数**/
-(NSInteger)rowNum{
    return self.dataArr.count;
}

/**获取AlbumID**/
-(NSString*)albumIDForRow:(NSInteger)row{
    NSInteger albumId = [self modelForRow:row].albumId;
    return [NSString stringWithFormat:@"%ld",albumId];
}

//请求数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [XMCatageoryNetworking getXMAlbumWithCategoryId:self.categoryId KeywordID:self.keywordId pageId:self.pageId completionHandle:^(XMAlbumModel* model, NSError *error) {
        if (error) {
            completionHandle(error);
            return ;
        }
        self.maxPageId = model.maxPageId;
        if (self.pageId == 1) {
            [self.dataArr removeAllObjects];
            [self.dataArr addObjectsFromArray:model.list];
        }else{
            [self.dataArr addObjectsFromArray:model.list];
        }
        completionHandle(error);
    }];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if (self.pageId == self.maxPageId) {
        return ;
    }else{
        self.pageId += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }
}

//获取最大页数



//获取每一行的对象
-(XMAlbumListModel*)modelForRow:(NSInteger)row{
    XMAlbumListModel* model = self.dataArr[row];
    return model;
}



@end
