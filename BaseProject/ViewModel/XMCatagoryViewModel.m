//
//  XMCatagoryViewModel.m
//  BaseProject
//
//  Created by stone on 16/6/16.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "XMCatagoryViewModel.h"

@implementation XMCatagoryViewModel

-(NSInteger)sectionNum{
    return self.dataArr.count/5;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{


    [XMCatageoryNetworking getXMCatagoryListCompletionHandle:^(XMCatageoryModel* model , NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:model.list];
        completionHandle(error);
    }];
}

-(NSURL *)URLForHeader{
    if (self.dataArr.count == 0) {
        return nil;
    }
    XMCatageoryList* model = self.dataArr[0];
    return [NSURL URLWithString:model.coverPath];
}

-(XMCatageoryList*)modelForSection:(NSInteger)section ForRow:(NSInteger)row{

    return [self modelArrayForSection:section][row];
}
-(NSArray*)modelArrayForSection:(NSInteger)section{
    if (section == 4) {
        NSRange range = NSMakeRange(section*6+1, 4);
        return [self.dataArr subarrayWithRange:range];
    }else{
    NSRange range = NSMakeRange(section*6+1, 6);
        return [self.dataArr subarrayWithRange:range];
    }
}

-(NSString*)titleForLeftButtonForSection:(NSInteger)section ForRow:(NSInteger)row
{
    return [self modelForSection:section ForRow:2*row].title;
}

/**获取左边按钮的id*/
-(NSInteger)IDForLeftBtForSection:(NSInteger)section ForRow:(NSInteger)row{
    return [self modelForSection:section ForRow:2*row].ID;
}

-(NSString *)titleForRightButtonForSection:(NSInteger)section ForRow:(NSInteger)row{
    return [self modelForSection:section ForRow:2*(row+1)-1].title;
}
/**获取右边按钮的id**/
-(NSInteger)IDForRightBtForSection:(NSInteger)section ForRow:(NSInteger)row{
    return [self modelForSection:section ForRow:2*(row+1)-1].ID;
}
-(NSURL *)URLForLeftButtonForSection:(NSInteger)section ForRow:(NSInteger)row
{
    NSString* path = [self modelForSection:section ForRow:2*row].coverPath;
    return [NSURL URLWithString:path];
}
-(NSURL *)URLForRightButtonForSection:(NSInteger)section ForRow:(NSInteger)row{

    NSString* path = [self modelForSection:section ForRow:2*(row+1)-1].coverPath;
    return [NSURL URLWithString:path];
}

/**头部视图的id**/
-(NSInteger)IDForHeader{
    XMCatageoryList* model = self.dataArr.firstObject;
    return model.ID;
}
/***头部视图的标题**/
-(NSString*)titleForHeader{
    XMCatageoryList* model = self.dataArr.firstObject;
    return model.title;
}



@end
