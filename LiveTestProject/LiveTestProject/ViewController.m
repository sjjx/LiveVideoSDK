//
//  ViewController.m
//  LiveTVSDKDemo
//
//  Created by ljf on 16/5/2.
//  Copyright © 2016年 com.Alex. All rights reserved.
//

#import "ViewController.h"
#import "PushLiveFlowViewController.h"
#import "LVMovieViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *rtmpUrlTextField;
@property (nonatomic, strong) PushLiveFlowViewController *liveShowViewController;

@end

@implementation ViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initSubviews];
    _rtmpUrlTextField.text = @"rtmp://";
}

#pragma mark - SetupSubviews

-(void)initSubviews {
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    float labelX      = 10;
    float labelY      = 150;
    float labelWidth  = screenWidth - 2*labelX;
    float labelHeight = 40;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
    label.text          = @"直播地址:";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    float textFieldX      = 10;
    float textFieldY      = labelY + labelHeight + 20;
    float textFieldWidth  = screenWidth - 2*textFieldX;
    float textFieldHeight = 40;
    
    _rtmpUrlTextField = [[UITextField alloc] initWithFrame:CGRectMake(textFieldX, textFieldY, textFieldWidth, textFieldHeight)];
    _rtmpUrlTextField.borderStyle         = UITextBorderStyleRoundedRect;
    _rtmpUrlTextField.returnKeyType       = UIReturnKeyDone;
    [self.view addSubview:_rtmpUrlTextField];
    
    float startButtonW = 150;
    float startButtonH = 40;
    float startButtonX = screenWidth/2 - startButtonW/2;
    float startButtonY = textFieldY + textFieldHeight + 50;
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(startButtonX, startButtonY, startButtonW, startButtonH)];
    startButton.backgroundColor     = [UIColor purpleColor];
    startButton.layer.masksToBounds = YES;
    startButton.layer.cornerRadius  = 10;
    [startButton setTitle:@"开始推流" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(statrButtonTouchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
    
    float playerButtonY = startButtonY + startButtonH + 50;
    UIButton *playerButton       = [[UIButton alloc] initWithFrame:CGRectMake(startButtonX, playerButtonY, startButtonW, startButtonH)];
    playerButton.backgroundColor     = [UIColor orangeColor];
    playerButton.layer.cornerRadius  = 10;
    [playerButton setTitle:@"开始播放" forState:UIControlStateNormal];
    [playerButton addTarget:self action:@selector(playerButtonTouchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playerButton];
}

#pragma mark - IBAction

-(void)statrButtonTouchAction:(id)sender{
    
    NSLog(@"Start live Rtmp:%@", _rtmpUrlTextField.text);
    _liveShowViewController = [[PushLiveFlowViewController alloc] init];
    _liveShowViewController.RtmpUrl = [NSURL URLWithString:_rtmpUrlTextField.text];
    [self presentViewController:_liveShowViewController animated:YES completion:nil];
}

- (void)playerButtonTouchAction:(id)sender {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        parameters[LVMovieParameterDisableDeinterlacing] = @(YES);
    
    /****这里换成直播、点播的地址****/
    NSString *path = @"rtmp://115.231.90.210/vod/CsAWblbiNQ6ABtEICGR-HIpar-0798.flv";
    LVMovieViewController *videoPlayVC = [LVMovieViewController movieViewControllerWithContentPath:path parameters:parameters];
    [self presentViewController:videoPlayVC animated:YES completion:nil];
}


#pragma mark - PrivateMethods

//隐藏键盘的方法
-(void)hidenKeyboard
{
    [_rtmpUrlTextField resignFirstResponder];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![_rtmpUrlTextField isExclusiveTouch]) {
        [_rtmpUrlTextField resignFirstResponder];
    }
}

@end
