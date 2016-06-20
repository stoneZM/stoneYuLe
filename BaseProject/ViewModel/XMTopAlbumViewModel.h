//
//  XMTopAlbumViewModel.h
//  BaseProject
//
//  Created by stone on 16/6/19.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "XMCatageoryNetworking.h"
#import "XMTopAlbumModel.h"
@interface XMTopAlbumViewModel : BaseViewModel

/**所需参数**/

@property(nonatomic,strong)NSString* key;
@property (nonatomic,strong)NSString* statEven;
@property (nonatomic,strong)NSString* statPage;
@property (nonatomic,assign)NSInteger pageId;
@property (nonatomic,assign)NSInteger maxPage;
@property (nonatomic,assign)NSInteger rowNum;

/***提供初始化方法**/
-(instancetype)initWithKey:(NSString*)key statEven:(NSString*)statEven statPage:(NSString*)statPage;

/**获取标题**/
-(NSString*)getTitleForRow:(NSInteger)row;

/**获取主播名**/
-(NSString*)getNickNameForRow:(NSInteger)row;
/**获取集数**/
-(NSString*)getTracksForRow:(NSInteger)row;
/**获取cover**/
-(NSURL*)getUrlForRow:(NSInteger)row;

/*为详情页传入albumID***/
-(NSString*)getAlbumIdForRow:(NSInteger)row;
/****/
/****/


@end
