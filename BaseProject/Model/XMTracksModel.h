//
//  XMTracksModel.h
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class XMTracksDataModel,XMTracksDataListModel;
@interface XMTracksModel : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, strong) XMTracksDataModel *data;

@property (nonatomic, copy) NSString *msg;

@end
@interface XMTracksDataModel : NSObject

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<XMTracksDataListModel *> *list;

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@end

@interface XMTracksDataListModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger userSource;

@property (nonatomic, assign) NSInteger processState;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger likes;

@property (nonatomic, copy) NSString *playPathHq;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, assign) NSInteger shares;

@property (nonatomic, copy) NSString *playPathAacv224;

@property (nonatomic, assign) long long createdAt;

@property (nonatomic, copy) NSString *smallLogo;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger playtimes;

@property (nonatomic, copy) NSString *playUrl64;

@property (nonatomic, copy) NSString *playPathAacv164;

@property (nonatomic, copy) NSString *playUrl32;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, assign) NSInteger comments;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) NSInteger opType;

@property (nonatomic, assign) BOOL isPublic;

@end

