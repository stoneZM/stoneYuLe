//
//  XMCatageoryModel.h
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class XMCatageoryList;
@interface XMCatageoryModel : BaseModel


@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<XMCatageoryList *> *list;

@end


@interface XMCatageoryList : NSObject

@property (nonatomic, assign) NSInteger ID;   ///

@property (nonatomic, assign) NSInteger orderNum;

@property (nonatomic, assign) BOOL filterSupported;

@property (nonatomic, assign) BOOL isChecked;

@property (nonatomic, assign) BOOL isFinished;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL selectedSwitch;

@property (nonatomic, assign) NSInteger categoryType;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *name;

@end

