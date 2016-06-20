//
//  XMListModel.m
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMListModel.h"

@implementation XMListModel

@end
@implementation XMListFocusimagesModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XMListFocusImagesListModel class]};
}

@end


@implementation XMListFocusImagesListModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


@implementation XMListCategorycontentsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XMListCatagoryContentsListModel class]};
}

@end


@implementation XMListCatagoryContentsListModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XMListCategorycontentsListListModel class]};
}

@end


@implementation XMListCategorycontentsListListModel

+ (NSDictionary *)objectClassInArray{
    return @{@"firstKResults" : [XMListCatagorycontentsListListFirstkresultsModel class]};
}

@end


@implementation XMListCatagorycontentsListListFirstkresultsModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


@implementation XMListKeywordsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XmListKeywordsListModel class]};
}

@end


@implementation XmListKeywordsListModel

@end


