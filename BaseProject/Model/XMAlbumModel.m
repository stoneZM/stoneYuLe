//
//  XMAlbumModel.m
//  BaseProject
//
//  Created by stone on 16/6/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMAlbumModel.h"

@implementation XMAlbumModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XMAlbumListModel class]};
}
@end
@implementation XMAlbumListModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end


