//
//  XMTopAlbumViewModel.m
//  BaseProject
//
//  Created by stone on 16/6/19.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMTopAlbumViewModel.h"

@implementation XMTopAlbumViewModel
-(NSInteger)rowNum{
    return self.dataArr.count;
}
-(instancetype)initWithKey:(NSString *)key statEven:(NSString *)statEven statPage:(NSString *)statPage{
    if (self = [super init]) {
        self.key = key;
        self.statPage = statPage;
        self.statEven = statEven;
    }
    return self;
}

/**获取标题**/
-(NSString*)getTitleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/**获取主播名**/
-(NSString*)getNickNameForRow:(NSInteger)row{
    return [self modelForRow:row].nickname;
}
/**获取集数**/
-(NSString*)getTracksForRow:(NSInteger)row{
    return  [NSString stringWithFormat:@"%ld",[self modelForRow:row].tracks];
}
/**获取cover**/
-(NSURL*)getUrlForRow:(NSInteger)row{
    NSString* path = [self modelForRow:row].coverSmall;
    return [NSURL URLWithString:path];
}
/*为详情页传入albumID***/
-(NSString*)getAlbumIdForRow:(NSInteger)row{
    NSInteger albumId = [self modelForRow:row].albumId;
    return [NSString stringWithFormat:@"%ld",albumId];
}

-(XMTopAlbumListModel*)modelForRow:(NSInteger)row{
    XMTopAlbumListModel* model = self.dataArr[row];
    return model;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [XMCatageoryNetworking getTopAlbumWithkey:self.key pageID:self.pageId statEven:self.statEven statPage:self.statPage complatetionHandle:^(XMTopAlbumModel* model, NSError *error) {
        if (error) {
            completionHandle(error);
            return ;
        }
        self.maxPage = model.maxPageId;
        if (self.pageId == 1 ) {
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
    if (self.pageId == self.maxPage) {
        return ;
    }
    self.pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}




@end
