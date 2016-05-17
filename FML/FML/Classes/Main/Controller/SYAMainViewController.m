//
//  SYAMainViewController.m
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYAMainViewController.h"
#import "SYAEssenceViewController.h"
#import "SYAFriendTrendViewController.h"
#import "SYAMeViewController.h"
#import "SYANewViewController.h"
#import "SYAPublishViewController.h"
#import "SYANavViewController.h"
#import "UIImage+SYAImage.h"
#import "SYATabBar.h"
@interface SYAMainViewController ()

@end

@implementation SYAMainViewController

#pragma mark - 设置tabBarItem上的字体
+ (void)load

{
    // 获取本类下的tabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
    // 字体大小只能在正常状态下设置
    NSMutableDictionary *norDict = [NSMutableDictionary dictionary];
    
    norDict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    [item setTitleTextAttributes:norDict forState:UIControlStateNormal];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加所有子控制器
    [self setupAllChildVC];
    [self setupTabBar];
}

#pragma mark - 添加所有子控制器

- (void)setupAllChildVC

{   // 精华
    SYAEssenceViewController *essenceVC = [[SYAEssenceViewController alloc] init];
    SYANavViewController *essenceNav = [[SYANavViewController alloc] initWithRootViewController:essenceVC];
    [self setupButton:essenceNav title:@"精华" normalImageName:@"tabBar_essence_icon" selImageName:@"tabBar_essence_click_icon"];
    [self addChildViewController:essenceNav];
    
    // 新帖
    SYANewViewController *newVC = [[SYANewViewController alloc] init];
    SYANavViewController *newNav = [[SYANavViewController alloc] initWithRootViewController:newVC];
    [self setupButton:newNav title:@"新帖" normalImageName:@"tabBar_new_icon" selImageName:@"tabBar_new_click_icon"];
    [self addChildViewController:newNav];
    // 发布
//    SYAPublishViewController *publishVC = [[SYAPublishViewController alloc] init];
//    SYANavViewController *publishNav = [[SYANavViewController alloc] initWithRootViewController:publishVC];
    // 关注
    SYAFriendTrendViewController *friendTrendVC = [[SYAFriendTrendViewController alloc] init];
    SYANavViewController *friendTrendNav = [[SYANavViewController alloc] initWithRootViewController:friendTrendVC];
    [self setupButton:friendTrendNav title:@"关注" normalImageName:@"tabBar_friendTrends_icon" selImageName:@"tabBar_friendTrends_click_icon"];
    [self addChildViewController:friendTrendNav];
    // 我的
    SYAMeViewController *meVC = [[SYAMeViewController alloc] init];
    SYANavViewController *meNav = [[SYANavViewController alloc] initWithRootViewController:meVC];
    [self setupButton:meNav title:@"我的" normalImageName:@"tabBar_me_icon"  selImageName:@"tabBar_me_click_icon"];
    
    [self addChildViewController:meNav];
    
}

#pragma mark - 设置tabBarItem内容

- (void)setupButton:(UIViewController *)VC title:(NSString *)title normalImageName:(NSString *)normalImageName selImageName:(NSString *)selImageName
{
    VC.tabBarItem.title = title;
    VC.tabBarItem.image = [UIImage imageWithRenderImageName:normalImageName];
    VC.tabBarItem.selectedImage = [UIImage imageWithRenderImageName:selImageName];
}

#pragma mark - 自定义tabBar,替换系统tabBar
- (void)setupTabBar
{
    SYATabBar *tabBar = [SYATabBar tabBar];
    [self setValue:tabBar forKey:@"tabBar"];
}
@end
