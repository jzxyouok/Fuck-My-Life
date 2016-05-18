//
//  SYAADViewController.m
//  FML
//
//  Created by zengqiang on 16/5/18.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYAADViewController.h"
#import "SYAMainViewController.h"
@interface SYAADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property (nonatomic, weak)  NSTimer*timer;
@end

@implementation SYAADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupADLaunchImage];
    // 这里target强引用定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
}

- (void)timeChange
{
    static int i = 3;
    i --;
    [self.jumpBtn setTitle:[NSString stringWithFormat:@"跳过 (%d)", i] forState:UIControlStateNormal];
    if (i < 0) {
        [self jumpBtnClick];
    }
}
#pragma mark - 点击按钮跳到主框架
- (IBAction)jumpBtnClick
{
    [UIApplication sharedApplication].keyWindow.rootViewController = [[SYAMainViewController alloc] init];
    // 销毁定时器
    [self.timer invalidate];
}

#pragma mark - 广告界面屏幕适配

- (void)setupADLaunchImage

{
    if (iPhone6P) { // iPhone6P
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
        NSLog(@"--");
    } else if (iPhone6) {
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iPhone5) {
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    } else if (iPhone4) {
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage"];
    }

}

@end
