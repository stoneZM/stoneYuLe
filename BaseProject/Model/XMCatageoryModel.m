//
//  XMCatageoryModel.m
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMCatageoryModel.h"

@implementation XMCatageoryModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XMCatageoryList class]};
}
@end

@implementation XMCatageoryList
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID" : @"id"};
}
@end


