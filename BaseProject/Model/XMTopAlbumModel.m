//
//  XMTopAlbumModel.m
//  BaseProject
//
//  Created by stone on 16/6/19.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMTopAlbumModel.h"

@implementation XMTopAlbumModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XMTopAlbumListModel class]};
}
@end
@implementation XMTopAlbumImagesModel

@end


@implementation XMTopSharecontentModel

@end


@implementation XMTopAlbumListModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}


@end


