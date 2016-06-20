//
//  XMListModel.h
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class XMListFocusimagesModel,XMListFocusImagesListModel,XMListCategorycontentsModel,XMListCatagoryContentsListModel,XMListCategorycontentsListListModel,XMListCatagorycontentsListListFirstkresultsModel,XMListKeywordsModel,XmListKeywordsListModel;
@interface XMListModel : BaseModel

@property (nonatomic, strong) XMListCategorycontentsModel *categoryContents;

@property (nonatomic, assign) BOOL hasRecommendedZones;

@property (nonatomic, strong) XMListKeywordsModel *keywords;

@property (nonatomic, strong) XMListFocusimagesModel *focusImages;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger ret;

@end
@interface XMListFocusimagesModel : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<XMListFocusImagesListModel *> *list;

@end

@interface XMListFocusImagesListModel : NSObject

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *shortTitle;

@property (nonatomic, assign) NSInteger ID;  ///

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) BOOL isShare;

@property (nonatomic, assign) BOOL is_External_url;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *longTitle;

@end

@interface XMListCategorycontentsModel : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<XMListCatagoryContentsListModel *> *list;

@end

@interface XMListCatagoryContentsListModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<XMListCategorycontentsListListModel *> *list;

@property (nonatomic, assign) NSInteger moduleType;

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic,assign)NSInteger keywordId;

@end

@interface XMListCategorycontentsListListModel : NSObject

@property (nonatomic, assign) NSInteger orderNum;

@property (nonatomic, assign) NSInteger top;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger period;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, assign) NSInteger firstId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *key;

@property (nonatomic, copy) NSString *rankingRule;

@property (nonatomic, copy) NSString *firstTitle;

@property (nonatomic, strong) NSArray<XMListCatagorycontentsListListFirstkresultsModel *> *firstKResults;

@property (nonatomic, copy) NSString *calcPeriod;

@property (nonatomic, copy) NSString *coverSmall;/////////

@property (nonatomic, copy) NSString *coverPathSmall;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic,assign)NSInteger playsCounts;

@property (nonatomic,assign)NSInteger tracks;

@property (nonatomic,assign)NSInteger albumId;

@end

@interface XMListCatagorycontentsListListFirstkresultsModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *contentType;

@end

@interface XMListKeywordsModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<XmListKeywordsListModel *> *list;

@end

@interface XmListKeywordsListModel : NSObject

@property (nonatomic, copy) NSString *keywordName;

@property (nonatomic, assign) NSInteger keywordType;

@property (nonatomic, assign) NSInteger keywordId;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, assign) NSInteger realCategoryId;

@end

