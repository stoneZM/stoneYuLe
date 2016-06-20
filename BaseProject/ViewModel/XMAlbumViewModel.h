//
//  XMAlbumViewModel.h
//  BaseProject
//
//  Created by stone on 16/6/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "XMCatageoryNetworking.h"

@interface XMAlbumViewModel : BaseViewModel

@property (nonatomic,assign)NSInteger categoryId;
@property (nonatomic,assign)NSInteger keywordId;

//用于分页加载
@property (nonatomic,assign)NSInteger pageId;
@property (nonatomic)NSInteger maxPageId;

@property (nonatomic,assign)NSInteger rowNum;
//提供一个初始化的方法，传入分类ID和关键ID
-(instancetype)initWithCatagoruId:(NSInteger)categoryId KeywordID:(NSInteger)keywordID;


//返回封面图片的URL
-(NSURL*)URLForcoverIVForRow:(NSInteger)row;
/**返回标题**/
-(NSString*)titleForRow:(NSInteger)row;
/**返回描述**/
-(NSString*)descForRow:(NSInteger)row;
/*返回播放次数**/
-(NSString*)playconutsForRow:(NSInteger)row;
/**返回集数**/
-(NSString*)tracksForRow:(NSInteger)row;

/**获取AlbumID**/
-(NSString*)albumIDForRow:(NSInteger)row;
/****/

@end
