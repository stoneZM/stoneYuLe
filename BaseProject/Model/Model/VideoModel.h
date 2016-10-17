//
//  VideoModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface VideoModel : BaseModel
@property (nonatomic, strong) NSString *videoHomeSid;
@property (nonatomic, strong) NSArray *videoSidList;
@property (nonatomic, strong) NSArray *videoList;
@end

@interface VideoVideoListModel : BaseModel
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *replyid;
@property (nonatomic, strong) NSString *mp4Url;
@property (nonatomic, assign) double playCount;
@property (nonatomic, strong) NSString *replyBoard;
@property (nonatomic, strong) NSString *vid;
@property (nonatomic, assign) double length;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) id m3u8HdUrl;
@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *videosource;
@property (nonatomic, assign) id mp4HdUrl;
@property (nonatomic, assign) double playersize;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) NSString *m3u8Url;
@end

@interface VideoVideoSidListModel : BaseModel
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imgsrc;
@end











