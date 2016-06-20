//
//  TopAlbumController.h
//  BaseProject
//
//  Created by stone on 16/6/19.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopAlbumController : UITableViewController

@property(nonatomic,strong)NSString* key;
@property (nonatomic,strong)NSString* statEven;
@property (nonatomic,strong)NSString* statPage;


/***提供初始化方法**/
-(instancetype)initWithKey:(NSString*)key statEven:(NSString*)statEven statPage:(NSString*)statPage;
@end
