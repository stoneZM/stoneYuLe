//
//  AlbumPlayController.m
//  BaseProject
//
//  Created by stone on 16/6/18.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "AlbumPlayController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AlbumPlayController ()
@property (nonatomic,strong)AVPlayer* player;
@property (nonatomic,strong)UIButton* button;
@property (nonatomic,strong)NSString* oldUrl;
@property (nonatomic,strong)XMAlbumDetailViewController* vc;
@end

@implementation AlbumPlayController

+(AlbumPlayController*)defaultWithPlayUrl:(NSString *)playUrl{
    static  AlbumPlayController* vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [[AlbumPlayController alloc]init];
    });
    vc.playUrl = playUrl;
    return vc;
}


-(AVPlayer *)player{
    if (_player == nil) {
        DDLogVerbose(@"%@",self.playUrl);
        NSURL* url = [NSURL URLWithString:self.playUrl];
        _player = [AlbumPlayController sharedInstance].player;
        _player = [AVPlayer playerWithURL:url];
    }
    return _player;
}

-(UIButton *)button{
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:self.button];
        [_button setBackgroundImage:[UIImage imageNamed:@"btn_srplay"] forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:@"cell_sound_pause_h"] forState:UIControlStateSelected];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(120, 120));
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-40);
        }];
        [_button bk_addEventHandler:^(UIButton* button) {
            _button.selected = !_button.selected;
            if (_button.isSelected) {
                [self.player pause];
            }else{
                 [self.player play];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

//为了保证同一时间只有一个播放器，使用单例模式
+(AVPlayerViewController*)sharedInstance
{
    static AVPlayerViewController* vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.oldCell = 0;
}
-(void)viewWillAppear:(BOOL)animated{
    self.playButton.selected = NO;
    self.player = nil;
    [self.player play];
}
//
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//    NSInteger newCellindex = [[object valueForKey:@"keyPath"] integerValue];
//    NSInteger oldCellindex = [change[@"old"] integerValue];
//    DDLogVerbose(@"new newn new %ld",newCellindex);
//    DDLogVerbose(@"old old old %ld",oldCellindex);
//    if (newCellindex == oldCellindex) {
//        return ;
//    }else{
//         self.player = nil;
//        [self.player play];
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
