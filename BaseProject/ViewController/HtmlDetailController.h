//
//  HtmlDetailController.h
//  BaseProject
//
//  Created by stone on 16/7/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HtmlDetailController : UIViewController

@property (nonatomic,strong)NSURL* webViewURL;

-(instancetype)initWithWebViewURL:(NSURL*)url;

@end
