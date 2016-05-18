//
//  SYAADViewController.m
//  FML
//
//  Created by zengqiang on 16/5/18.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYAADViewController.h"
#import "SYAMainViewController.h"
#import "SYANetWorkTool.h"
#import "SYAADItem.h"
#import <MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>
#define SYACode2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
@interface SYAADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property (nonatomic, weak)  NSTimer*timer;
@property (nonatomic, strong) SYAADItem *item;
@end

@implementation SYAADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupADLaunchImage];
    [self loadData];
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
        
    } else if (iPhone6) {
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iPhone5) {
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    } else if (iPhone4) {
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage"];
    }

}
#pragma mark - 加载广告数据
- (void)loadData
{
    SYANetWorkTool *netTool = [SYANetWorkTool shareNetWorkTool];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = SYACode2;
    [netTool GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *adDict = [responseObject[@"ad"] firstObject];
        
        self.item = [SYAADItem mj_objectWithKeyValues:adDict];
        
        UIImageView *adImageView = [[UIImageView alloc] init];
        adImageView.userInteractionEnabled = YES;
        if (self.item.w) {
            CGFloat h = SYAScreenW / self.item.w * self.item.h;
            adImageView.frame = CGRectMake(0, 0, SYAScreenW, h);
        }
        
        // 添加点按手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [adImageView addGestureRecognizer:tap];
        [adImageView sd_setImageWithURL:[NSURL URLWithString:self.item.w_picurl]];
        [self.imageView addSubview:adImageView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark - 点击广告调用
- (void)tap
{
    NSURL *url = [NSURL URLWithString:self.item.ori_curl];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }
}
@end
