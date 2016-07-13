//
//  TuWanNetworking.h
//  BaseProject
//
//  Created by stone on 16/7/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseNetManager.h"

typedef NS_ENUM(NSInteger,InfoType) {

    TouTiao,
    Dujia,
    HeiAn,
    MuoShou,
    FenBao,
    LuShi,
    XinJi,
    ShouWang,
    TuPian,
    ShiPing,
    GongLiu,
    HuanHua,
    QuWen,
    COS,
    MeiNv

};

@interface TuWanNetworking : BaseNetManager

+(id)getTuWanModelWithType:(InfoType)type Start:(NSInteger)start completationHandle:(void(^)(id responseObj,NSError* error))completationHandle;


@end
