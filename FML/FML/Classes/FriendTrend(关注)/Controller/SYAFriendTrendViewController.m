//
//  SYAFriendTrendViewController.m
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYAFriendTrendViewController.h"

@interface SYAFriendTrendViewController ()

@end

@implementation SYAFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavgationBar];
}

#pragma mark - 设置导航条内容
- (void)setupNavgationBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemNormalImage:[UIImage imageNamed:@"friendsRecommentIcon"] highlightImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] selectImage:nil target:self action:@selector(addTrends)];
    self.navigationItem.title = @"我的关注";
}
#pragma mark - 导航条按钮点击的方法
- (void)addTrends
{
    
}
@end
