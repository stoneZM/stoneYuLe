//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by stone on 16/7/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"

@interface TuWanViewModel : BaseViewModel

@property (nonatomic,assign)NSInteger infoType;
@property (nonatomic,assign)NSInteger rowNum;
@property (nonatomic,assign)NSInteger pageID;
@property (nonatomic,assign)NSInteger maxPageId;




-(instancetype)initWithInfoType:(NSInteger)infoType;

-(NSString*)titleForRow:(NSInteger)row;
-(NSString*)descForRow:(NSInteger)row;
-(NSURL*)coverURLForRow:(NSInteger)row;
-(NSString*)clickforRow:(NSInteger)row;
-(BOOL)showTypeForRow:(NSInteger)row;
-(NSArray*)showitemsForRow:(NSInteger)row;

-(NSURL*)htmlURLForRow:(NSInteger)row;

@end
