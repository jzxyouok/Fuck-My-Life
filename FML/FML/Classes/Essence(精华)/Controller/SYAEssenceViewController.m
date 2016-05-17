//
//  SYAEssenceViewController.m
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYAEssenceViewController.h"
#import "UIBarButtonItem+SYABarButtonItem.h"
@interface SYAEssenceViewController ()

@end

@implementation SYAEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavgationBar];
}

#pragma mark - 设置导航条内容
- (void)setupNavgationBar
{
   self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemNormalImage:[UIImage imageNamed:@"nav_item_game_icon"] highlightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] selectImage:nil target:self action:@selector(game)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemNormalImage:[UIImage imageNamed:@"navigationButtonRandom"] highlightImage:[UIImage imageNamed:@"navigationButtonRandomClick"] selectImage:nil target:self action:@selector(random)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle" ]];
}

#pragma mark - 导航条按钮点击的方法
- (void)game
{
    
}
- (void)random
{
    
}
@end
