//
//  XMListViewModel.h
//  BaseProject
//
//  Created by stone on 16/6/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "XMCatageoryNetworking.h"
#import "XMListModel.h"
@interface XMListViewModel : BaseViewModel

#pragma Catagory
@property (nonatomic,assign)NSInteger categoryID;
@property (nonatomic,strong)NSString* staEvent;
@property (nonatomic,strong)NSString* staModule;


/**分区数*/
@property (nonatomic,assign)NSInteger sectionNum;
/**每个分区的行数*/
-(NSInteger)rowNumInSection:(NSInteger)section;


/**获取头部滚动展示图数组**/
@property (nonatomic,strong)NSMutableArray* focusImages;
/**关键词**/
@property (nonatomic,strong)NSMutableArray* keywords;
/**获取分组**/
@property (nonatomic,strong)NSMutableArray* categoryContents;


/***获取滚动视图的URL**/
-(NSURL*)urlForSrcollForindex:(NSInteger)index;

/** 特定分区的特定单元格的标题*/
-(NSString*)titleForSection:(NSInteger)section ForRow:(NSInteger)row;
/**图片的url*/
-(NSURL*)UrlForSection:(NSInteger)section forRow:(NSInteger)row;
/** 描述*/
-(NSString*)descForSection:(NSInteger)section ForRow:(NSInteger)row;
/**播放次数*/
-(NSString*)playTimesForSection:(NSInteger)section ForRow:(NSInteger)row;
/** 集数*/
-(NSString*)tracksForSection:(NSInteger)section ForRow:(NSInteger)row;

/** header的标题*/
-(NSString*)headerTitleForSection:(NSInteger)section;
/**获取ablumID*/
-(NSString*)albumIDForSection:(NSInteger)section ForRow:(NSInteger)row;


/**给top50传入所需的key*/
-(NSString*)keyForTopInSection;
/**给top50传入statEven*/
-(NSString*)statEvenForTopInSection;
/**获取点击更多按钮所需的keywordId*/
-(NSDictionary*)keywordIdForMoreInSection:(NSInteger)section;

#pragma Keywords


-(instancetype)initWithCategoryID:(NSInteger)categoryID staEvent:(NSString*)staEvent staModule:(NSString*)staModule;

/**返回WMpageController每一页的标题*/
-(NSString*)titleForWMVCForPage:(NSInteger)page;
/***返回WMpageController的总页数*/
@property (nonatomic,assign)NSInteger pageNum;

-(NSArray*)headeritemNames;
-(NSArray*)headerKeywordID;


@end
