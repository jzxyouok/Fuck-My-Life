//
//  SYANewViewController.m
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYANewViewController.h"

@interface SYANewViewController ()

@end

@implementation SYANewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavgationBar];
}

#pragma mark - 设置导航条内容
- (void)setupNavgationBar

{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemNormalImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightImage:[UIImage imageNamed:@"MainTagSubIconClick"] selectImage:nil target:self action:@selector(tag)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
#pragma mark - 导航条按钮点击的方法
- (void)tag

{
    NSLog(@"tag");
}
@end
