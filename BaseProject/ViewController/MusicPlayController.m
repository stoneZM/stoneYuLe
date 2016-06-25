//
//  MusicPlayController.m
//  BaseProject
//
//  Created by stone on 16/6/23.
//  Copyright © 2016年 zm. All rights reserved.
//
#import "XMCategoryTableViewController.h"
#import "MusicPlayController.h"
#import "UIView+Extension.h"
#import <AVFoundation/AVFoundation.h>
#import "UIImage+ZMExtension.h"
#import <MediaPlayer/MediaPlayer.h>
@interface MusicPlayController ()

@property (nonatomic,strong)XMCategoryTableViewController* vc;
/**
 用于接收歌曲图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *coverIV;
/**
 自定义进度条
 */
@property (weak, nonatomic) IBOutlet UIView *progressView;
/**
 显示歌曲的时长
 */
@property (weak, nonatomic) IBOutlet UILabel *durationLb;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sliderBtnLeadConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressViewWidthContraint;
/**
 滑块按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *sliderBtn;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UIButton *preBtn;



- (IBAction)playOrPurse:(UIButton *)sender;
- (IBAction)nextBtn:(UIButton *)sender;
- (IBAction)preBtn:(UIButton *)sender;
- (IBAction)musicBackBtn:(id)sender;
- (IBAction)tapProgressView:(UITapGestureRecognizer *)sender;
/**
 播放功能所需的属性
 */
@property (nonatomic,strong)AVAsset* avset;
@property (nonatomic,strong)AVPlayerItem* avItem;
@property (nonatomic,strong)NSMutableDictionary* musicPlayer;


@property (nonatomic,strong)NSTimer* timer;                   //用于刷新进度条的的定时器
@property (weak, nonatomic) IBOutlet UIButton *playOrPuseBtn;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;

@property (nonatomic,assign)NSInteger currentindex;
@end


@implementation MusicPlayController


- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];

    [self resignFirstResponder];

}

/**
 存放所有的音乐模型
 */
-(NSArray *)musicModels{
    if (_musicModels == nil) {
        _musicModels = [NSArray new];
    }
    return _musicModels;
}


-(NSMutableDictionary *)musicPlayer{
    if (_musicPlayer == nil) {
        _musicPlayer = [NSMutableDictionary new];
    }
    return _musicPlayer;
}


-(XMAlbumDetailDataTracksListModel*)getModelForindex:(NSInteger)index{
    return self.musicModels[index];
}

-(void)showWithMusicModels:(NSArray *)musicModels index:(NSInteger)index{
    self.musicModels = musicModels;
    self.currentindex = index;

    self.playOrPuseBtn.selected = NO;

    UIWindow* windows = [UIApplication sharedApplication].keyWindow;
    [windows addSubview:self.view];
    self.view.frame = windows.bounds;
    self.view.y = windows.height;
    self.view.hidden = NO;
    windows.userInteractionEnabled = NO;                //关闭界面交互，防止重复点击

    [UIView animateWithDuration:0.5 animations:^{
        self.view.y = 0;
    } completion:^(BOOL finished) {

        [self setCoverImageView];

        windows.userInteractionEnabled = YES;           //打开界面交互
        [self playMusic];                               //播放音乐
    }];

}
-(void)setCoverImageView{

    [self.coverImageView sd_setImageWithURL: [NSURL URLWithString:[self getModelForindex:self.currentindex].coverMiddle] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_2"]];
}


-(void)playMusic{

    AVPlayer* player = self.musicPlayer[@(self.currentindex)];   //根据传进来的url判断是否有播放器在播放

    if (!player) {                                               //如果没有，则说明是新的url，那么就移除原来的播放器

        [self removeTimer];
        [self resetProgress];
        for (NSString* key in self.musicPlayer) {                //在新建之前，先移除定时器，重置进度条
            [self.musicPlayer removeObjectForKey:key];
            self.musicPlayer = nil;
        }
        self.avset= [AVURLAsset URLAssetWithURL:[NSURL URLWithString:[self getModelForindex:self.currentindex].playPathHq] options:nil];
        self.avItem = [AVPlayerItem playerItemWithAsset:self.avset];

                                                                    //添加视频播放结束通知
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(musicPlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.avItem];

        player = [AVPlayer playerWithPlayerItem:self.avItem];     //并且兴建一个播放器
        self.musicPlayer[@(self.currentindex)] = player;          //将此播放器存入缓存 ，为下一次判断做准备
        [self backOrForWordPlay:player];                          //开启前后台播放模式
        [self rotationImageView];                                //旋转图片
        [self addTimer];                                         //开启新的定时器

    }else {
            return ;
        }
        [self initialize];                                        //设置后台播放所需的方法；
        [self configNowPlayingInfoCenter];                          //设置进入后台之后的显示内容
}

/**
 暂停或者播放设置
 */

- (IBAction)playOrPurse:(UIButton *)sender {

    AVPlayer* player = nil ;
    for (NSString* str in self.musicPlayer) {
        player = self.musicPlayer[str];             //从缓存中获取当前正在运行的播放器
    }
    sender.selected = !sender.selected;             //按钮状态反选
    if (sender.isSelected) {
        [player pause];   //选中按钮，暂停歌曲
        [self removeTimer];
    }else{
        [player play];
        [self addTimer];
    }
}

/**
 播放下一首
 */

- (IBAction)nextBtn:(UIButton *)sender {
    //TODO:下一首播放
    if (self.currentindex == self.musicModels.count -1) {
        self.currentindex = 0;
    }else{
        self.currentindex += 1;
    }
    [self setCoverImageView];
    [self configNowPlayingInfoCenter];
    [self playMusic];
}

/**
 播放上一首
 */

- (IBAction)preBtn:(UIButton *)sender {
    //TODO: 上一首播放
    if (self.currentindex == 0) {
        self.currentindex = self.musicModels.count-1;
    }else{
        self.currentindex -= 1;
    }
    [self setCoverImageView];
    [self configNowPlayingInfoCenter];
    [self playMusic];
}

/**
 播放界面推出
 */

- (IBAction)musicBackBtn:(id)sender {

    UIWindow* windows = [UIApplication sharedApplication].keyWindow;

    windows.userInteractionEnabled = NO;

    [UIView animateWithDuration:0.5 animations:^{

        self.view.y = self.view.height;

    } completion:^(BOOL finished) {

        windows.userInteractionEnabled = YES;
        self.view.hidden = YES;

    }];

}

/**当一首播放结束时，自动跳到下一曲*/
- (void)musicPlayDidEnd:(NSNotification *)notification{

    if (self.currentindex == self.musicModels.count-1) {
        return;
    }
    self.currentindex += 1;
    [self playMusic];

}

#pragma  mark 点击进度条或者拉动滑块的响应事件
- (IBAction)tapProgressView:(UITapGestureRecognizer *)sender {

    //按钮滑块响应点击动作
    CGPoint point = [sender locationInView:self.view];
       self.sliderBtn.x = point.x;
       self.progressView.width = self.sliderBtn.center.x;

    //更改当前播放时间
    CMTime total = self.avset.duration;
    NSInteger totalduration = CMTimeGetSeconds(total);
    NSInteger currentTime = self.sliderBtn.center.x * totalduration / self.view.width;
    CMTime changedTime = CMTimeMakeWithSeconds(currentTime, 1);
    [self.avItem seekToTime:changedTime completionHandler:^(BOOL finished) {

    }];
}

- (IBAction)panProgressView:(UIPanGestureRecognizer *)sender {

    //按钮滑块响应拖拽动作
        CGPoint point = [sender translationInView:self.view];
        [sender setTranslation:CGPointZero inView:self.view];
        CGFloat maxX = self.view.width - self.sliderBtn.width;
        if (sender.view.x<0) {
        sender.view.x = 0;
        }else if(sender.view.x > maxX ){
        sender.view.x = maxX;
        }
        self.sliderBtn.x += point.x;
        self.progressView.width = self.sliderBtn.center.x;


    //更改当前播放的时间
    CMTime total = self.avset.duration;
    NSInteger totalduration = CMTimeGetSeconds(total);
    NSInteger currentTime = self.sliderBtn.center.x * totalduration / self.view.width;
    CMTime changedTime = CMTimeMakeWithSeconds(currentTime, 1);
    [self.avItem seekToTime:changedTime completionHandler:^(BOOL finished) {

    }];
}


#pragma mark 添加定时器，对进度条进行处理
-(void)addTimer{
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer bk_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {

        [self updateProgress];

    } repeats:YES];
    
}

/**
 销毁定时器
 */
-(void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)updateProgress{

    //获取总时间和当前播放的时间
    CMTime total = self.avset.duration;
    CMTime current = self.avItem.currentTime;
    NSInteger totalduration = CMTimeGetSeconds(total);
    NSInteger currentTime = CMTimeGetSeconds(current);
    float scale = currentTime*1.0/totalduration;

    //改变进度条的状态
    self.sliderBtnLeadConstraint.constant = scale*(self.view.width-self.sliderBtn.width);
    self.progressViewWidthContraint.constant = self.sliderBtn.center.x;

    //显示标签和按钮上的时间
    NSString* currentTimeLb = [self formateTime:currentTime];
    NSString* labelTime = [self formateTime:totalduration];
    self.sliderBtn.titleLabel.text = currentTimeLb;
    self.durationLb.text = labelTime;

}
/**
 重置按钮与进度条的位置
 */
-(void)resetProgress{
    self.sliderBtn.x = 0;
    self.sliderBtn.titleLabel.text = [self formateTime:0];
    self.progressView.width = self.sliderBtn.center.x;
}


-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:self.avItem];
    NSLog(@"销毁啦");
}
/**
 旋转动画
 */
-(void)rotationImageView{
    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.fromValue = @(0);
    anim.toValue = @(M_PI*2);
    anim.repeatCount = NSIntegerMax;
    anim.duration = 40;
    [self.coverImageView.layer addAnimation:anim forKey:nil];
}

/**
 格式化时间
 */
-(NSString*)formateTime:(NSInteger)duration{
    NSInteger mintues = duration / 60;
    int second = duration % 60;
    return [NSString stringWithFormat:@"%02ld:%02d",mintues,second];
}

#pragma mark 实现后台的播放

static AVAudioSession* session = nil;
- (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 音频会话
        session = [AVAudioSession sharedInstance];
        // 设置会话类型（播放类型、播放模式,会自动停止其他音乐的播放）
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];

        // 激活会话
        [session setActive:YES error:nil];
    });
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    // 为了显示锁屏状态下的内容

    [application beginReceivingRemoteControlEvents];


}
-(void)backOrForWordPlay:(AVPlayer*)player{

    UIBackgroundTaskIdentifier bgTask = 0;
    if([UIApplication sharedApplication].applicationState== UIApplicationStateBackground) {
        NSLog(@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx后台播放");
        [player play];
        UIApplication*app = [UIApplication sharedApplication];

        UIBackgroundTaskIdentifier newTask = [app beginBackgroundTaskWithExpirationHandler:nil];

        if(bgTask!= UIBackgroundTaskInvalid) {
            [app endBackgroundTask: bgTask];
        }
        bgTask = newTask;

    } else {

        NSLog(@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx前台播放");
        
        [player play];
    }
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    //    event.type; // 事件类型
    //    event.subtype; // 事件的子类型
    //    UIEventSubtypeRemoteControlPlay                 = 100,
    //    UIEventSubtypeRemoteControlPause                = 101,
    //    UIEventSubtypeRemoteControlStop                 = 102,
    //    UIEventSubtypeRemoteControlTogglePlayPause      = 103,
    //    UIEventSubtypeRemoteControlNextTrack            = 104,
    //    UIEventSubtypeRemoteControlPreviousTrack        = 105,
    //    UIEventSubtypeRemoteControlBeginSeekingBackward = 106,
    //    UIEventSubtypeRemoteControlEndSeekingBackward   = 107,
    //    UIEventSubtypeRemoteControlBeginSeekingForward  = 108,
    //    UIEventSubtypeRemoteControlEndSeekingForward    = 109,
    switch (event.subtype) {
        case UIEventSubtypeRemoteControlPlay:
        case UIEventSubtypeRemoteControlPause:
            [self playOrPurse:nil];
            break;

        case UIEventSubtypeRemoteControlNextTrack:
            [self nextBtn:nil];
            break;

        case UIEventSubtypeRemoteControlPreviousTrack:
            [self preBtn:nil];
        default:
            break;
    }
}

//Make sure we can recieve remote control events

- (BOOL)canBecomeFirstResponder {
    
    return YES;
    
}

- (void)configNowPlayingInfoCenter {

    MPNowPlayingInfoCenter *center = [MPNowPlayingInfoCenter defaultCenter];

    // 初始化播放信息
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    // 专辑名称
    info[MPMediaItemPropertyAlbumTitle] = [self getModelForindex:self.currentindex].nickname;
    // 歌手
    info[MPMediaItemPropertyArtist] = [self getModelForindex:self.currentindex].nickname;
    // 歌曲名称
    info[MPMediaItemPropertyTitle] = [self getModelForindex:self.currentindex].title;
    // 设置图片
    info[MPMediaItemPropertyArtwork] = [[MPMediaItemArtwork alloc] initWithImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self getModelForindex:self.currentindex].coverLarge]]]];
    // 设置持续时间（歌曲的总时间）
    info[MPMediaItemPropertyPlaybackDuration] = @(CMTimeGetSeconds(self.avset.duration));
    // 设置当前播放进度
    info[MPNowPlayingInfoPropertyElapsedPlaybackTime] = @(CMTimeGetSeconds(self.avItem.currentTime));

    // 切换播放信息
    center.nowPlayingInfo = info;

    // 远程控制事件 Remote Control Event
    // 加速计事件 Motion Event
    // 触摸事件 Touch Event

    // 开始监听远程控制事件
    // 成为第一响应者（必备条件）
    [self becomeFirstResponder];
    // 开始监控
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    

 }



@end
