//
//  TuWanModel.h
//  BaseProject
//
//  Created by stone on 16/7/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"
@class TuWanDataModel,TuWanDataListInfochildModel,TuWanDataListShowItemInfoModel;

@interface TuWanModel : BaseModel
@property (nonatomic,assign)NSInteger code;
@property (nonatomic,strong)TuWanDataModel* data;
@property (nonatomic,strong)NSString* msg;
@end

@interface TuWanDataModel : BaseModel
@property (nonatomic,strong)NSArray* indexPic;
@property (nonatomic,strong)NSArray* list;
@end

@interface TuWanDataIndexPicModel : BaseModel
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *showtype;
@property (nonatomic, strong) NSString *click;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *typechild;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *longtitle;
@property (nonatomic, strong) NSString *html5;
@property (nonatomic, assign) id toutiao;
@property (nonatomic, strong) NSString *litpic;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *murl;
@property (nonatomic, strong) NSString *banner;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, assign) id timer;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *indexpicDescription;
@end

@interface TuWanDataListModel : BaseModel
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *showtype;
@property (nonatomic, strong) NSString *click;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *typechild;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *longtitle;
@property (nonatomic, strong) NSString *html5;
@property (nonatomic, assign) id toutiao;
@property (nonatomic, strong) TuWanDataListInfochildModel *infochild;
@property (nonatomic, strong) NSString *litpic;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, assign) double pictotal;
@property (nonatomic, strong) NSArray *showitem;
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *murl;
@property (nonatomic, strong) NSString *banner;
@property (nonatomic, assign) double zangs;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, assign) id timer;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *desc;
@end

@interface TuWanDataListInfochildModel : BaseModel
@end

@interface TuWanDataListShowitemModel : BaseModel
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) TuWanDataListShowItemInfoModel *info;
@end

@interface TuWanDataListShowItemInfoModel : BaseModel
@property (nonatomic, assign) double width;
@property (nonatomic, assign) double height;
@end
