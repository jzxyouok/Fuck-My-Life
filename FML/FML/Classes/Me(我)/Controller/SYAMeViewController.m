//
//  SYAMeViewController.m
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYAMeViewController.h"

@interface SYAMeViewController ()

@end

@implementation SYAMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavgationBar];
}

#pragma mark - 设置导航条内容
- (void)setupNavgationBar
{
    UIBarButtonItem *itemNight = [UIBarButtonItem barButtonItemNormalImage:[UIImage imageNamed:@"mine-moon-icon"] highlightImage:nil selectImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(night:)];
    UIBarButtonItem *itemSetting = [UIBarButtonItem barButtonItemNormalImage:[UIImage imageNamed:@"mine-setting-icon"] highlightImage:[UIImage imageNamed:@"mine-setting-icon-click"] selectImage:nil target:self action:@selector(setting)];
    // 从数组中第一个元素开始,从右向左开始布局
    self.navigationItem.rightBarButtonItems = @[itemSetting, itemNight];
    self.navigationItem.title = @"我的关注";
}
#pragma mark - 导航条按钮点击的方法
- (void)night:(UIButton *)btn
{
    btn.selected = !btn.selected;
}

- (void)setting
{
   
}

@end
