//
//  XMAlbumDetailModel.h
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class XMAlbumDetailDataModel,XMAlbumDetailAlbumModel,XMAlbumDetailDataTracksModel,XMAlbumDetailDataTracksListModel,XMAlbumDetailDataUserModel;
@interface XMAlbumDetailModel : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, strong) XMAlbumDetailDataModel *data;

@property (nonatomic, copy) NSString *msg;

@end
@interface XMAlbumDetailDataModel : NSObject

@property (nonatomic, strong) XMAlbumDetailDataTracksModel *tracks;

@property (nonatomic, copy) NSString *viewTab;

@property (nonatomic, strong) XMAlbumDetailAlbumModel *album;

@property (nonatomic, strong) XMAlbumDetailDataUserModel *user;

@end

@interface XMAlbumDetailAlbumModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *coverWebLarge;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, assign) BOOL hasNew;

@property (nonatomic, assign) NSInteger shares;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, assign) long long createdAt;

@property (nonatomic, assign) BOOL isVerified;

@property (nonatomic, assign) BOOL isRecordDesc;

@property (nonatomic, copy) NSString *avatarPath;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) long long updatedAt;

@property (nonatomic, assign) long long lastUptrackAt;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, copy) NSString *coverOrigin;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *introRich;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger playTrackId;

@property (nonatomic, assign) BOOL isFavorite;

@property (nonatomic, assign) NSInteger serializeStatus;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, assign) NSInteger playTimes;

@end

@interface XMAlbumDetailDataTracksModel : NSObject

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<XMAlbumDetailDataTracksListModel *> *list;

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@end

@interface XMAlbumDetailDataTracksListModel : NSObject

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

@interface XMAlbumDetailDataUserModel : NSObject

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *nickname;

@end

