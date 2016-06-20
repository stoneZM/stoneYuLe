//
//  XMTopAlbumModel.h
//  BaseProject
//
//  Created by stone on 16/6/19.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class XMTopAlbumImagesModel,XMTopSharecontentModel,XMTopAlbumListModel;
@interface XMTopAlbumModel : BaseModel

@property (nonatomic, strong) XMTopSharecontentModel *shareContent;

@property (nonatomic, strong) NSArray *categories;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger rankId;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<XMTopAlbumListModel *> *list;

@property (nonatomic, strong) XMTopAlbumImagesModel *images;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger pageSize;

@end
@interface XMTopAlbumImagesModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *list;

@end

@interface XMTopSharecontentModel : NSObject

@property (nonatomic, copy) NSString *picUrl;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *rowKey;

@property (nonatomic, assign) NSInteger lengthLimit;

@property (nonatomic, copy) NSString *shareType;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *weixinPic;

@property (nonatomic, copy) NSString *url;

@end

@interface XMTopAlbumListModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger tracksCounts;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, assign) NSInteger lastUptrackAt;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger lastUptrackId;

@end

