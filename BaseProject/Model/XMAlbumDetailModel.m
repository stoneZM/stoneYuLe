//
//  XMAlbumDetailModel.m
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMAlbumDetailModel.h"

@implementation XMAlbumDetailModel

@end
@implementation XMAlbumDetailDataModel

@end


@implementation XMAlbumDetailAlbumModel

@end


@implementation XMAlbumDetailDataTracksModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XMAlbumDetailDataTracksListModel class]};
}

@end


@implementation XMAlbumDetailDataTracksListModel

@end


@implementation XMAlbumDetailDataUserModel

@end


