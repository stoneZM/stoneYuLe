//
//  BaseNetManager.h
//  BaseProject
//
// Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kCompletionHandle completionHandle:(void(^)(id model, NSError *error))completionHandle

@interface BaseNetManager : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

@end
