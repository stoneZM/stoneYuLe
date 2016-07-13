//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by stone on 16/7/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TuWanViewModel.h"
#import "TuWanNetworking.h"
#import "TuWanModel.h"

@implementation TuWanViewModel

-(BOOL)showTypeForRow:(NSInteger)row{
    DDLogVerbose(@"%@",[self modelForRow:row].showtype);
    return [[self modelForRow:row].showtype integerValue];
}
-(NSArray *)showitemsForRow:(NSInteger)row{
    NSMutableArray* arr = [NSMutableArray new];
    NSArray* models = [self modelForRow:row].showitem;
    for ( TuWanDataListShowitemModel* model in models) {
        [arr addObject:[NSURL URLWithString:model.pic]];
    }
    return [arr copy];
}

-(instancetype)initWithInfoType:(NSInteger)infoType{
    if (self = [super init]) {
        self.infoType = infoType;
    }
    return self;
}

-(NSInteger)rowNum{
    return self.dataArr.count;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{

    [TuWanNetworking getTuWanModelWithType:self.infoType Start:self.pageID completationHandle:^(TuWanModel* model, NSError *error) {
        if (self.pageID == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        completionHandle(error);
    }];

}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{

    self.pageID = 0;
    [self getDataFromNetCompleteHandle:^(NSError *error) {

        completionHandle(error);
    }];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{

    self.pageID += 10;
    [self getDataFromNetCompleteHandle:^(NSError *error) {
        completionHandle(error);
    }];
}


-(TuWanDataListModel*)modelForRow:(NSInteger)row{
    TuWanDataListModel* model = self.dataArr[row];
    return model;
}




-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
-(NSString *)descForRow:(NSInteger)row{
    return [self modelForRow:row].desc;
}
-(NSURL *)coverURLForRow:(NSInteger)row{
    NSString* path = [self modelForRow:row].litpic;
    return [NSURL URLWithString:path];
}
-(NSString *)clickforRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%@人浏览",[self modelForRow:row].click];
}

-(NSURL *)htmlURLForRow:(NSInteger)row{
    NSString* path = [self modelForRow:row].html5;
    return [NSURL URLWithString:path];
}




@end
