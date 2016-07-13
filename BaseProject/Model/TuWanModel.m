//
//  TuWanModel.m
//  BaseProject
//
//  Created by stone on 16/7/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TuWanModel.h"

@implementation TuWanModel
@end

@implementation TuWanDataModel
+(NSDictionary*)objectClassInArray{
    return @{@"indexPic":[TuWanDataIndexPicModel class],@"list":[TuWanDataListModel class]};
}

@end

@implementation TuWanDataIndexPicModel
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{@"typeName":@"typename"};
}
@end

@implementation TuWanDataListModel
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{@"typeName":@"typename",@"desc":@"description"};
}
+(NSDictionary *)objectClassInArray{
    return @{@"showitem":[TuWanDataListShowitemModel class]};
}
@end

@implementation TuWanDataListInfochildModel
@end

@implementation TuWanDataListShowitemModel
@end

@implementation TuWanDataListShowItemInfoModel
@end