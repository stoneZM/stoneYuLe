//
//  TuWanNetworking.m
//  BaseProject
//
//  Created by stone on 16/7/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TuWanNetworking.h"
#import "TuWanModel.h"


@implementation TuWanNetworking

+(id)getTuWanModelWithType:(InfoType)type Start:(NSInteger)start completationHandle:(void (^)(id, NSError *))completationHandle{
    switch (type) {
        case TouTiao: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case Dujia: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&ap000000pid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case HeiAn: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=83623&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case MuoShou: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=31537&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case FenBao: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=31538&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case LuShi: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=31528&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case XinJi: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=91821&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case ShouWang: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=57067&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case TuPian: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&type=pic&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case ShiPing: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&type=video&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case GongLiu: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&type=guide&dtid=83623,31528,31537,31538,57067,91821&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case HuanHua: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=幻化&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case QuWen: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&dtid=0&class=heronews&mod=趣闻&classmore=indexpic&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case COS: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&class=cos&mod=cos&classmore=indexpic&dtid=0&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
        case MeiNv: {
            NSString* path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=美女&classmore=indexpic&typechild=cos1&appid=1&appver=2.1&start=%ld",start];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completationHandle([TuWanModel objectWithKeyValues:responseObj],error);
            }];
            break;
        }
    }
}

@end
