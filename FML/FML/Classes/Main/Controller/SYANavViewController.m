//
//  SYANavViewController.m
//  FML
//
//  Created by zengqiang on 16/5/17.
//  Copyright © 2016年 zengqiang. All rights reserved.
//

#import "SYANavViewController.h"

@interface SYANavViewController ()<UIGestureRecognizerDelegate>

@end

@implementation SYANavViewController
#pragma mark - 修改导航条内容相关属性
+ (void)initialize

{
    UINavigationBar *navgationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    navgationBar.titleTextAttributes = dict;
    [navgationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    #pragma clang diagnostic ignored "-Wundeclared-selector"
    // 去掉handleNavigationTransition:的警告
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    // 不允许边缘手势触发
    self.interactivePopGestureRecognizer.enabled = NO;
    pan.delegate = self;
    
}
#pragma mark - 实现全屏滑动返回
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count > 1;
}
#pragma mark - 拦截push方法,设置全局返回按钮

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 根控制器不需要设置返回按钮
    if (self.childViewControllers.count) {
      
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemNormalImage:[UIImage imageNamed:@"navigationButtonReturn"] highlightImage:[UIImage imageNamed:@"navigationButtonReturnClick"] selectImage:nil title:@"返回" contentInset:UIEdgeInsetsMake(0, -20, 0, 0) target:self action:@selector(back)];
       
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    // 一定要调用super
    [super pushViewController:viewController animated:animated];
    
}
/*
 全局返回还有更简单的实现方法,这里暂时就写这个比较正统的
 */
#pragma mark - 返回
- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
