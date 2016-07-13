//
//  HtmlDetailController.m
//  BaseProject
//
//  Created by stone on 16/7/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HtmlDetailController.h"

@interface HtmlDetailController ()
@property (nonatomic,strong)UIWebView* webView;
@end

@implementation HtmlDetailController

-(instancetype)initWithWebViewURL:(NSURL *)url{
    if (self = [super init]) {
        self.webViewURL = url;
    }
    return self;
}

-(UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc]init];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.webViewURL]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
