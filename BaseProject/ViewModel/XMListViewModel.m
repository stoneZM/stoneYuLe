//
//  XMListViewModel.m
//  BaseProject
//
//  Created by stone on 16/6/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMListViewModel.h"

@implementation XMListViewModel

-(instancetype)initWithCategoryID:(NSInteger)categoryID staEvent:(NSString *)staEvent staModule:(NSString *)staModule{

    if (self = [super init]) {
        _categoryID = categoryID;
        _staEvent = staEvent;
        _staModule = staModule;
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
-(NSMutableArray *)keywords{
    if (_keywords == nil) {
        _keywords = [NSMutableArray new];
    }
    return _keywords;
}
-(NSMutableArray *)focusImages{
    if (_focusImages == nil) {
        _focusImages = [[NSMutableArray alloc]init];
    }
    return _focusImages;
}
-(NSMutableArray *)categoryContents{
    if (_categoryContents == nil) {
        _categoryContents = [[NSMutableArray alloc]init];
    }
    return _categoryContents;
}
-(NSInteger)sectionNum{
    return self.categoryContents.count;
}
-(NSInteger)rowNumInSection:(NSInteger)section{
    XMListCategorycontentsModel* model = self.categoryContents[section];
        return model.list.count;
}


-(NSString *)titleForSection:(NSInteger)section ForRow:(NSInteger)row{
    NSString* title = [self modelInSection:section inRow:row].title;
    return  title;
}
/***获取滚动视图的URL**/
-(NSURL*)urlForSrcollForindex:(NSInteger)index{
    NSString* path = [self modelForIndex:index].pic;
    return [NSURL URLWithString:path];
}
-(XMListFocusImagesListModel*)modelForIndex:(NSInteger)index{
    XMListFocusImagesListModel* model = self.focusImages[index];
    return model;
}
/**图片的url*/
-(NSURL*)UrlForSection:(NSInteger)section forRow:(NSInteger)row{
    NSString* path = nil;
    if (section == 0) {
       path = [self modelInSection:section inRow:row].coverPath;
    }else if(section == 2){
        path = [self modelInSection:section inRow:row].coverPathSmall;
    }else{
         path = [self modelInSection:section inRow:row].coverSmall;
    }
    return [NSURL URLWithString:path];
}
/** 描述*/
-(NSString*)descForSection:(NSInteger)section ForRow:(NSInteger)row{
    if (section == 0 && section == 2) {
        return [self modelInSection:section inRow:row].subtitle;
    }else{
        return [self modelInSection:section inRow:row].intro;
    }
}
/** header的标题*/
-(NSString*)headerTitleForSection:(NSInteger)section{
    XMListCatagoryContentsListModel* model = self.categoryContents[section];
    return model.title;
}

/**播放次数*/
-(NSString*)playTimesForSection:(NSInteger)section ForRow:(NSInteger)row{
    NSInteger count = [self modelInSection:section inRow:row].playsCounts;
    if (count < 10000) {
        return [NSString stringWithFormat:@"%ld",count];
    }else{
        return [NSString stringWithFormat:@"%.1lf万",count*1.0/10000];
    }
}
/** 集数*/
-(NSString*)tracksForSection:(NSInteger)section ForRow:(NSInteger)row{
    NSInteger tracks = [self modelInSection:section inRow:row].tracks;
    return [NSString stringWithFormat:@"%ld集",tracks];
}

/**获取ablumID*/
-(NSString*)albumIDForSection:(NSInteger)section ForRow:(NSInteger)row{
    NSInteger albumID = [self modelInSection:section inRow:row].albumId;
    return [NSString stringWithFormat:@"%ld",albumID];
}

/**给top50传入所需的key*/
-(NSString*)keyForTopInSection{
    return [self modelInSection:0 inRow:0].key;
}
/**给top50传入statEven*/
-(NSString*)statEvenForTopInSection{
    return [self modelInSection:0 inRow:0].title;
}

//获取每个分区单元格的对象
-(XMListCategorycontentsListListModel*)modelInSection:(NSInteger)section inRow:(NSInteger)row{
    XMListCatagoryContentsListModel* model = self.categoryContents[section];
    XMListCategorycontentsListListModel* listModel2 = model.list[row];
    return listModel2;
}


/**获取点击更多按钮所需的keywordId*/
-(NSDictionary*)keywordIdForMoreInSection:(NSInteger)section{
    NSInteger keywords = [self modelForKeywordInSection:section].keywordId;
    NSInteger categoryID = [self keywordsModelForPage:1].categoryId;
    NSDictionary* dic = @{@"keywords":[NSString stringWithFormat:@"%ld",keywords],@"categoryID":[NSString stringWithFormat:@"%ld",categoryID]};
    return  dic;
}

//获取keywordId所在的对象
-(XMListCatagoryContentsListModel*)modelForKeywordInSection:(NSInteger)section{
    XMListCatagoryContentsListModel* model = self.categoryContents[section];
    
    return model;
}


#pragma  mark  Keywords
//获取keywordsName所在的对象
-(XmListKeywordsListModel*)keywordsModelForPage:(NSInteger)page{
    XmListKeywordsListModel* model = self.keywords[page];
    return model;
}
/**返回WMpageController每一页的标题*/
-(NSString*)titleForWMVCForPage:(NSInteger)page{
    return [self keywordsModelForPage:page].keywordName;
}
/***返回WMpageController的总页数*/
-(NSInteger)pageNum{
    return self.keywords.count;
}

-(NSArray*)headeritemNames{
    NSMutableArray* arr = [[NSMutableArray alloc]init];
    for (XmListKeywordsListModel* model in self.keywords) {
        NSString* str = model.keywordName;
        [arr addObject:str];
    }
    return [arr copy];
}
-(NSArray*)headerKeywordID{

    NSMutableArray* arr = [[NSMutableArray alloc]init];
    for (XmListKeywordsListModel* model in self.keywords) {
        NSInteger ID = model.keywordId;
        NSInteger categoryID = model.categoryId;
        NSMutableDictionary* dic = [NSMutableDictionary new];
        [dic setValue:[NSString stringWithFormat:@"%ld",ID] forKey:@"keywords"];
        [dic setValue:[NSString stringWithFormat:@"%ld",categoryID] forKey:@"categoryID"];
        [arr addObject:dic];
    }
    return [arr copy];
}


//网络请求数据
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [XMCatageoryNetworking getXMListWithCategoryId:self.categoryID statEvent:self.staEvent statModule:self.staModule compltetionHandle:^(XMListModel* model , NSError *error) {
        if (error) {
            completionHandle(error);
            return ;
        }
        [self.keywords removeAllObjects];
        [self.focusImages removeAllObjects];
        [self.categoryContents removeAllObjects];
        [self.categoryContents addObjectsFromArray:model.categoryContents.list];
        [self.focusImages addObjectsFromArray:model.focusImages.list];
        [self.keywords addObjectsFromArray:model.keywords.list];
        //TODO: 获取数据
        completionHandle(error);
    }];
}






@end
