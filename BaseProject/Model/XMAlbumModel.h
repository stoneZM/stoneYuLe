//
//  XMAlbumModel.h
//  BaseProject
//
//  Created by stone on 16/6/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class XMAlbumListModel;
@interface XMAlbumModel : BaseModel

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, strong) NSArray *subfields;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<XMAlbumListModel *> *list;

@property (nonatomic, assign) NSInteger ret;




@end
@interface XMAlbumListModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@property (nonatomic, assign) NSInteger commentsCount;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *coverLarge;

@end

