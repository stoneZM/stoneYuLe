//
//  XMCatagoryViewModel.h
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "XMCatageoryNetworking.h"
#import "XMCatageoryModel.h"
@interface XMCatagoryViewModel : BaseViewModel


/***左边按钮的标题**/
-(NSString*)titleForLeftButtonForSection:(NSInteger)section  ForRow:(NSInteger)row;
/***右边按钮的标题**/
-(NSString*)titleForRightButtonForSection:(NSInteger)section ForRow:(NSInteger)row;
/***左边按钮的图片**/
-(NSURL*)URLForLeftButtonForSection:(NSInteger)section  ForRow:(NSInteger)row;
/***右边按钮的图片**/
-(NSURL*)URLForRightButtonForSection:(NSInteger)section  ForRow:(NSInteger)row;
/**获取左边按钮的id*/
-(NSInteger)IDForLeftBtForSection:(NSInteger)section ForRow:(NSInteger)row;
/**获取右边按钮的id**/
-(NSInteger)IDForRightBtForSection:(NSInteger)section ForRow:(NSInteger)row;

/***头部视图图片**/
-(NSURL*)URLForHeader;
/**头部视图的id**/
-(NSInteger)IDForHeader;
/***头部视图的标题**/
-(NSString*)titleForHeader;

@property (nonatomic)NSInteger sectionNum;
@property (nonatomic,assign)NSInteger rowNum;

@end
