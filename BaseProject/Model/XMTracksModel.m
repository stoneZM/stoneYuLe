//
//  XMTracksModel.m
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMTracksModel.h"

@implementation XMTracksModel

@end
@implementation XMTracksDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XMTracksDataListModel class]};
}

@end


@implementation XMTracksDataListModel

@end


